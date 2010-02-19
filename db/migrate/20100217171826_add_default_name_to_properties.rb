class AddDefaultNameToProperties < ActiveRecord::Migration
  def self.up
    execute "ALTER TABLE properties ALTER COLUMN name SET DEFAULT '1'"
  end

  def self.down
  end
end
