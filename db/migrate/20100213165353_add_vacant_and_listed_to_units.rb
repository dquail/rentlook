class AddVacantAndListedToUnits < ActiveRecord::Migration
  def self.up
    add_column :units, :listed, :boolean
    add_column :units, :rented, :boolean
  end

  def self.down
    remove_column :units, :listed
    remove_column :units, :rented
  end
end
