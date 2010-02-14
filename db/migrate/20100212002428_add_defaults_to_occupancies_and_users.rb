class AddDefaultsToOccupanciesAndUsers < ActiveRecord::Migration
  def self.up
    execute "ALTER TABLE occupancies ALTER COLUMN status SET DEFAULT 'A'"
    execute "ALTER TABLE users ALTER COLUMN type SET DEFAULT 'Landlord'"
  end

  def self.down
  end
end
