class AddStatusToApplications < ActiveRecord::Migration
  def self.up
    add_column :applications, :status, :boolean, :limit=>1
  end

  def self.down
    remove_column :applications, :status
  end
end
