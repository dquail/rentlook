class CreateOccupancies < ActiveRecord::Migration
  def self.up
    create_table :occupancies do |t|
      t.integer :tenant_id
      t.integer :unit_id
      t.string :status, :limit=>1
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end

  def self.down
    drop_table :occupancies
  end
end
