class AddStatusToUnit < ActiveRecord::Migration
  def self.up
    add_column :units, :status_id, :integer, :default=>1
  end

  def self.down
    remove_column :units, :status_id
  end
end
