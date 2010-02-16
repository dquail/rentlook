class AddDefaultsAgainToLeases < ActiveRecord::Migration
  def self.up
    add_column :leases, :landlord_approved, :boolean, :default=>true
    add_column :leases, :tenant_approved, :boolean, :default=>false
  end

  def self.down
    remove_column :leases, :landlord_approved
    remove_column :leases, :tenant_approved
  end
end
