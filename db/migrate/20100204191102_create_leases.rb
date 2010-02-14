class CreateLeases < ActiveRecord::Migration
  def self.up
    create_table :leases do |t|
      t.integer :manager_id
      t.integer :tenant_id
      t.date :start_date
      t.date :end_date
      t.integer :rent
      t.boolean :auto_collect
      t.boolean :auto_incriment
      t.integer :auto_incriment_pct
      t.integer :rent_due_date

      t.timestamps
    end
  end

  def self.down
    drop_table :leases
  end
end
