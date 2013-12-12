class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.text :comment
      t.integer :callout_id

      t.timestamps
    end
  end
end
