class InterestConnector < ActiveRecord::Base
  belongs_to :interest
  belongs_to :interestable, :polymorphic => true
end
