class CreateProperties < ActiveRecord::Migration
  def self.up
    create_table :properties do |t|
      t.integer :user_id
      t.string :name, :limit => 30
      t.string :address, :limit => 30
      t.string :city, :limit => 30
      t.string :state, :limit => 20
      t.string :zip, :limit => 15
      t.string :country, :limit => 20

      t.timestamps
    end
  end

  def self.down
    drop_table :properties
  end
end
