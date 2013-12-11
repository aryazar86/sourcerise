class User < ActiveRecord::Base
  authenticates_with_sorcery!

  belongs_to :user_role
  has_many :interest_connectors, :as => :interestable
  has_many :interests, :through => :interest_connectors

  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  validates :email, presence: true
  validates :email, uniqueness: true

end
