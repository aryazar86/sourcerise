class Callout < ActiveRecord::Base
  belongs_to :user
  has_many :interest_connectors, :as => :interestable
  has_many :interests, :through => :interest_connectors

  delegate :user_role_id, to: :user


  def is_callout?
    self.user_role_id == 1
  end

  def is_suggestion?
    self.user_role_id == 2
  end

end
