class RemoveStatusToUnit < ActiveRecord::Migration
  def self.up
    remove_column :units, :status_id
  end

  def self.down
    add_column :units, :status_id, :integer
  end
end
