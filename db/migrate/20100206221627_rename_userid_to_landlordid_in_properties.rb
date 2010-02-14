class RenameUseridToLandlordidInProperties < ActiveRecord::Migration
  def self.up
    rename_column :properties, :user_id, :landlord_id
  end

  def self.down
    rename_column :properties, :landlord_id, :user_id
  end
end
