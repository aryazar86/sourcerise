class Interest < ActiveRecord::Base
  belongs_to :parent, :class_name => "Interest"
  has_many :sub_interests, :class_name => "Interest", :foreign_key => :parent_id

  has_many :interest_connectors
  
  has_many  :users, 
            :through => :interest_connectors, 
            :source => :interestable, 
            :source_type => "User"
  
  has_many  :callouts, 
            :through => :interest_connectors, 
            :source => :interestable, 
            :source_type => "Callout"

end
