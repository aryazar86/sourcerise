class AddImageToCallouts < ActiveRecord::Migration
  def change
    add_column :callouts, :image, :string
  end
end
