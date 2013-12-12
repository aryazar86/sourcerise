class Callout < ActiveRecord::Base
  belongs_to :user
  has_many :replies
  
  delegate :user_role_id, to: :user

  validates :deadline, presence: true
  validates :subject, presence: true
  validates :user_id, presence: true
  validates :description, presence: true


  def is_callout?
    self.user_role_id == 1
  end

  def is_suggestion?
    self.user_role_id == 2
  end

end
