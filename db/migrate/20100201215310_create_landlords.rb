class CreateLandlords < ActiveRecord::Migration
  def self.up
    create_table :landlords do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :hashed_password
      t.string :salt

      t.timestamps
    end
  end

  def self.down
    drop_table :landlords
  end
end
