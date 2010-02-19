class AddDefaultImageToProperties < ActiveRecord::Migration
  def self.up
    execute "ALTER TABLE properties ALTER COLUMN image_url SET DEFAULT 'apartment.png'"
  end

  def self.down
  end
end
