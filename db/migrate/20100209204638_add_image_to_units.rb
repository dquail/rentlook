class AddImageToUnits < ActiveRecord::Migration
  def self.up
    add_column :units, :image_url, :string
  end

  def self.down
    remove_column :units, :image_url
  end
end
