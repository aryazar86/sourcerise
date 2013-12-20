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

  mount_uploader :image, ImageUploader

  def is_callout?
    self.user_role_id == 1
  end

  def is_suggestion?
    self.user_role_id == 2
  end


  def self.filter_callouts(interested_items)
    c = Callout.all
    filtered_callouts = []

    interested_items.each do |interest_in_question|
      c.each do |x|
        x.interests.each do |y|
          if y.name.include?(interest_in_question.name)
            filtered_callouts << x
          end
        end
      end
    end
    filtered_callouts.uniq
    # filtered_callouts
  end
end