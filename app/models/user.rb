class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :callouts

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
    u = User.all
    filtered_callouts = []

    interested_items.each do |interest_in_question|
      u.each do |x|
        x.interests.each do |y|
          if y.name.include?(interest_in_question.name)
            filtered_callouts << x
          end
        end
      end
    end
    filtered_callouts.uniq!
    filtered_callouts
  end

end
