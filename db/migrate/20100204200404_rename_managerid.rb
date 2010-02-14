class RenameManagerid < ActiveRecord::Migration
  def self.up
    rename_column :leases, :manager_id, :unit_id
  end

  def self.down
    rename_column :leases, :unit_id, :manager_id
  end
end
