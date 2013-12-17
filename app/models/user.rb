class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :callouts

  belongs_to :user_role
  has_many :interest_connectors, :as => :interestable
  has_many :interests, :through => :interest_connectors

  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  validates :email, presence: true
  validates :email, uniqueness: true




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
