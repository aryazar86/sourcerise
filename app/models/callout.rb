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

  def self.get_callouts(user_id)
    callouts = Callout.all
    if user_id == 1
      output = callouts.select {|c| c.is_suggestion?}
    elsif user_id == 2
      output = callouts.select {|c| c.is_callout?}
    end
    output
  end

  def self.filter_callouts(interested_in, user_id)
    callouts = Callout.get_callouts(user_id)
    filtered_callouts = []
    #For each of the interests passed in, we check to see if it's present in each callout's interests, and if it is, that callout gets added to the ouput array.
    interested_in.each do |interest_in_question|
      callouts.each { |a_callout| filtered_callouts << a_callout if a_callout.interests
        .include?(interest_in_question) }
    end
    filtered_callouts.uniq
  end
end