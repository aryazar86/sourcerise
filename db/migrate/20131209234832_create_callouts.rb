class CreateCallouts < ActiveRecord::Migration
  def change
    create_table :callouts do |t|
      t.string :subject
      t.datetime :deadline
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end
