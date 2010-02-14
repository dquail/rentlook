class AddTypeToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :type, :string
    add_column :users, :status, :string, :limit=>1
  end

  def self.down
    remove_column :users, :status
    remove_column :users, :type
  end
end
