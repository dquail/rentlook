class CreateStatusUnitTable < ActiveRecord::Migration
  def self.up
    create_table :statuses_leases do |t|
      t.integer :status_id
      t.integer :unit_id

      t.timestamps
    end
  end

  def self.down
    drop_table :statuses_leases
  end
end
