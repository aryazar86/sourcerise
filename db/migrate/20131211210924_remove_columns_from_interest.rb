class RemoveColumnsFromInterest < ActiveRecord::Migration
  def change    
    remove_column :interests, :interestable_type
    remove_column :interests, :interestable_id
  end
end
