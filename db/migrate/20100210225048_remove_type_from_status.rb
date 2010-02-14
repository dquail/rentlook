class RemoveTypeFromStatus < ActiveRecord::Migration
  def self.up
    remove_column :statuses, :type
  end

  def self.down
    add_column :statuses, :type,:string
  end
end
