class Callout < ActiveRecord::Base
  belongs_to :user

  has_many :replies
  
  delegate :user_role_id, to: :user

  validates :deadline, presence: true
  validates :subject, presence: true
  validates :user_id, presence: true
  validates :description, presence: true

  has_many :interest_connectors, :as => :interestable
  has_many :interests, :through => :interest_connectors

  delegate :user_role_id, to: :user

  accepts_nested_attributes_for :interest_connectors

  def is_callout?
    self.user_role_id == 1
  end

  def is_suggestion?
    self.user_role_id == 2
  end

end
