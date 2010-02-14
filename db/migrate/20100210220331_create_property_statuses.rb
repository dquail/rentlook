class CreatePropertyStatuses < ActiveRecord::Migration
  def self.up
    create_table :property_statuses do |t|
      t.string :status
      t.timestamps
    end
  end

  def self.down
    drop_table :property_statuses
  end
end
