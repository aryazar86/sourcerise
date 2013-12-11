class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.string :name
      t.string :topic
      t.integer :parent_id
      t.text :description
      t.string :interestable_type
      t.integer :interestable_id

      t.timestamps
    end
  end
end
