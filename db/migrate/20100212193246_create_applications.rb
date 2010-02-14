class CreateApplications < ActiveRecord::Migration
  def self.up
    create_table :applications do |t|
      t.integer :unit_id
      t.integer :tenant_id
      t.string :term_type
      t.date :start_date
      t.date :end_date
      t.integer :first_month_cost
      t.integer :security_deposit_cost
      t.integer :credit_check_cost
      t.integer :other_amount_cost
      t.string :current_rental_address
      t.string :current_rental_date
      t.string :current_rental_vacate_reason
      t.string :current_rental_landlord_name
      t.string :current_rental_landlord_phone
      t.string :previous_rental_address
      t.string :previous_rental_date
      t.string :previous_rental_vacate_reason
      t.string :previous_rental_landlord_name
      t.string :previous_rental_landlord_phone
      t.string :other_rental_address
      t.string :other_rental_date
      t.string :other_rental_vacate_reason
      t.string :other_rental_landlord_name
      t.string :other_rental_landlord_phone
      t.string :current_employer_name
      t.string :current_employer_address
      t.string :current_employer_supervisor_name
      t.string :current_employer_supervisor_phone
      t.string :current_employer_title
      t.string :current_employer_date
      t.string :previous_employer_name
      t.string :previous_employer_address
      t.string :previous_employer_supervisor_name
      t.string :previous_employer_supervisor_phone
      t.string :previous_employer_title
      t.string :previous_employer_date
      t.integer :gross_income
      t.integer :other_income
      t.integer :savings_account
      t.string :savings_bank
      t.string :savings_branch
      t.string :credit_type
      t.string :credit_account
      t.string :credit_name
      t.integer :credit_owed
      t.integer :credit_payment

      t.string :credit_name
      t.integer :loan_owed
      t.integer :loan_payment

      t.timestamps
    end
  end

  def self.down
    drop_table :applications
  end
end
