class Reply < ActiveRecord::Base
  belongs_to :callout
  belongs_to :sender, class_name: "User"
  has_one :receiver, class_name: "User"
end
