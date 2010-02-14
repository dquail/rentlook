class CreateRentApplications < ActiveRecord::Migration
  def self.up
    create_table :rent_applications do |t|
      t.integer :unit_id
      t.integer :user_id
      t.text :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :rent_applications
  end
end
