class CreateInterestConnectors < ActiveRecord::Migration
  def change
    create_table :interest_connectors do |t|
      t.integer :interest_id
      t.integer :interestable_id
      t.string :interestable_type
      t.timestamps
    end
  end
end
