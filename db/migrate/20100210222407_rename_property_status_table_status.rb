class RenamePropertyStatusTableStatus < ActiveRecord::Migration
  def self.up
    rename_table :property_statuses, :status
  end

  def self.down
    rename_table :status,:property_statuses
  end
end
