class RenameTableLeasesStatuses < ActiveRecord::Migration
  def self.up
    rename_table :statuses_leases, :statuses_units
  end

  def self.down
    rename_table :statuses_units, :statuses_leases
  end
end
