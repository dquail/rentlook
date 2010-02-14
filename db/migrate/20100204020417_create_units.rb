class CreateUnits < ActiveRecord::Migration
  def self.up
    create_table :units do |t|
      t.integer :property_id
      t.integer :bedrooms
      t.integer :bathrooms
      t.integer :square_feet
      t.integer :base_rent
      t.text :amenities

      t.timestamps
    end
  end

  def self.down
    drop_table :units
  end
end
