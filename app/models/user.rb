class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  validates :email, presence: true
  validates :email, uniqueness: true

  belongs_to :user_role
  has_many :interests, :as => :interestable
  
end
