class AddDefaultsToLeases < ActiveRecord::Migration
  def self.up
    execute "ALTER TABLE leases ALTER COLUMN rent SET DEFAULT 1000"
    execute "ALTER TABLE leases ALTER COLUMN auto_collect SET DEFAULT 0"
    execute "ALTER TABLE leases ALTER COLUMN auto_incriment SET DEFAULT 0"
    execute "ALTER TABLE leases ALTER COLUMN auto_incriment_pct SET DEFAULT 0"
    execute "ALTER TABLE leases ALTER COLUMN rent_due_date SET DEFAULT 1"
  end

  def self.down
  end
end
