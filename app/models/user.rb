class User < ActiveRecord::Base
  authenticates_with_sorcery!

  MEDIA = 1
  SOURCE = 2

  has_many :callouts

  has_many :replies

  belongs_to :user_role
  has_many :interest_connectors, :as => :interestable
  has_many :interests, :through => :interest_connectors

  validates :password, confirmation: true, :on => :create
  validates :password_confirmation, presence: true, :on => :create

  validates :email, presence: true
  validates :email, uniqueness: true

  def is_media?
    self.user_role_id == 1
  end

  def is_source?
    self.user_role_id == 2
  end


  def self.filter_users(interested_items)
    all_users = User.all

    filtered_callouts = interested_items.map do |interest_in_question|
      all_users.each do |user|
        user.interests.each do |interest|
          if interest.name.include?(interest_in_question.name)
            user
          end
        end
      end
    end
    filtered_callouts.uniq
  end
end
