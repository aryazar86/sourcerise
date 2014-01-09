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

  mount_uploader :image, ImageUploader


  def is_media?
    self.user_role_id == 1
  end

  def is_source?
    self.user_role_id == 2
  end

  def self.get_users(user_role_id)
    if user_role_id == 1
      users = User.all.select{|u| u.is_source?}
    elsif user_role_id == 2
      users = User.all.select{|u| u.is_media?}
    end
    users
  end


  def self.filter_users(interested_in, user_role_id)
    u = User.get_users(user_role_id)
    filtered_users = []

    interested_in.each do |interest_in_question|
      u.each {|user| filtered_users << user if 
        user.interests.include?(interest_in_question) }
    end
    filtered_users.uniq
  end
end
