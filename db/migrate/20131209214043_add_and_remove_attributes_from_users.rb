class AddAndRemoveAttributesFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :username

    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :bio, :text
    add_column :users, :organization, :string
    add_column :users, :location, :string

  end
end
