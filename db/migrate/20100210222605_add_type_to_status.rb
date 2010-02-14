class AddTypeToStatus < ActiveRecord::Migration
  def self.up
    add_column :status, :type, :string
  end

  def self.down
    remove_column :type
  end
end
