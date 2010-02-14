class AddDefaultForApplicationStatus < ActiveRecord::Migration
  def self.up
    execute "ALTER TABLE applications ALTER COLUMN status SET DEFAULT 'N'"
  end

  def self.down
  end
end
