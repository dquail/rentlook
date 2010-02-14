class AddImageToProperty < ActiveRecord::Migration
  def self.up
    add_column :properties, :image_url, :string
  end

  def self.down
    remove_column :properties, :image_url
  end
end
