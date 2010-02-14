class ChangeStatusTypeForApplications < ActiveRecord::Migration
  def self.up
    change_column :applications, :status, :string
  end

  def self.down
    change_column :applications, :status, :boolean
  end
end
