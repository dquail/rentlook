class AddDefaultListedrentedToUnits < ActiveRecord::Migration
  def self.up
    execute "ALTER TABLE units ALTER COLUMN rented SET DEFAULT '0'"
    execute "ALTER TABLE units ALTER COLUMN listed SET DEFAULT '0'"
  end

  def self.down
  end
end
