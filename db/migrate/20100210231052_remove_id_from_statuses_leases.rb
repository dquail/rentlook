class RemoveIdFromStatusesLeases < ActiveRecord::Migration
  def self.up
    remove_column :statuses_units, :id
  end

  def self.down
    add_column :statuses_units, :id, :integer
  end
end
