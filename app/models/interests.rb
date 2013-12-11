class Interests < ActiveRecord::Base
  belongs_to :user
  belongs_to :callout
  belongs_to :parent, :class_name => "Interest"
  has_many :sub_interests, :class_name => "Interest", :foreign_key => :parent_id

  belongs_to :interestable, polymorphic: true

end
