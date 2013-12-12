class InterestConnectorsController < ApplicationController
  before_filter :load_interestable

  def create
    @interest_connector = @interestable.interest_connectors.build(interest_connector_params)
    @interest_connector.interest = params[:interest]
  end

  def destroy
  end

  private
  def interest_connector_params
    params.require(:interest_connector).permit(:interest_id, :interestable_id, :interestable_type)
  end

  def load_interestable
    @interestable = params[:interest_connector][:interestable_type]
                    .constantize
                    .find(params[:interest_connector][:interestable_id])
  end
end
