class AddNameToUnit < ActiveRecord::Migration
  def self.up
    add_column :units, :name, :string
  end

  def self.down
    remove_column :units, :name
  end
end
