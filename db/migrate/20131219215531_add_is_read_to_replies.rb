class AddIsReadToReplies < ActiveRecord::Migration
  def change
    add_column :replies, :is_read, :boolean
  end
end
