class ChangeDefaultLeaseLandlordApprovedValue < ActiveRecord::Migration
  def self.up
    execute "ALTER TABLE leases ALTER COLUMN landlord_approved SET DEFAULT '0'"
  end

  def self.down
  end
end
