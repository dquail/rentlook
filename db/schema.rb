# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100218235005) do

  create_table "applications", :force => true do |t|
    t.integer  "unit_id"
    t.integer  "tenant_id"
    t.string   "term_type"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "first_month_cost"
    t.integer  "security_deposit_cost"
    t.integer  "credit_check_cost"
    t.integer  "other_amount_cost"
    t.string   "current_rental_address"
    t.string   "current_rental_date"
    t.string   "current_rental_vacate_reason"
    t.string   "current_rental_landlord_name"
    t.string   "current_rental_landlord_phone"
    t.string   "previous_rental_address"
    t.string   "previous_rental_date"
    t.string   "previous_rental_vacate_reason"
    t.string   "previous_rental_landlord_name"
    t.string   "previous_rental_landlord_phone"
    t.string   "other_rental_address"
    t.string   "other_rental_date"
    t.string   "other_rental_vacate_reason"
    t.string   "other_rental_landlord_name"
    t.string   "other_rental_landlord_phone"
    t.string   "current_employer_name"
    t.string   "current_employer_address"
    t.string   "current_employer_supervisor_name"
    t.string   "current_employer_supervisor_phone"
    t.string   "current_employer_title"
    t.string   "current_employer_date"
    t.string   "previous_employer_name"
    t.string   "previous_employer_address"
    t.string   "previous_employer_supervisor_name"
    t.string   "previous_employer_supervisor_phone"
    t.string   "previous_employer_title"
    t.string   "previous_employer_date"
    t.integer  "gross_income"
    t.integer  "other_income"
    t.integer  "savings_account"
    t.string   "savings_bank"
    t.string   "savings_branch"
    t.string   "credit_type"
    t.string   "credit_account"
    t.string   "credit_name"
    t.integer  "credit_owed"
    t.integer  "credit_payment"
    t.integer  "loan_owed"
    t.integer  "loan_payment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status",                             :default => "N"
  end

  create_table "leases", :force => true do |t|
    t.integer  "unit_id"
    t.integer  "tenant_id"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "rent",               :default => 1000
    t.boolean  "auto_collect",       :default => false
    t.boolean  "auto_incriment",     :default => false
    t.integer  "auto_incriment_pct", :default => 0
    t.integer  "rent_due_date",      :default => 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "landlord_approved",  :default => false
    t.boolean  "tenant_approved",    :default => false
  end

  create_table "occupancies", :force => true do |t|
    t.integer  "tenant_id"
    t.integer  "unit_id"
    t.string   "status",     :limit => 1, :default => "A"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "properties", :force => true do |t|
    t.integer  "landlord_id"
    t.string   "name",               :limit => 30, :default => "1"
    t.string   "address",            :limit => 30
    t.string   "city",               :limit => 30
    t.string   "state",              :limit => 20
    t.string   "zip",                :limit => 15
    t.string   "country",            :limit => 20
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_url",                        :default => "apartment.png"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "rent_applications", :force => true do |t|
    t.integer  "unit_id"
    t.integer  "user_id"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "statuses", :force => true do |t|
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statuses_units", :id => false, :force => true do |t|
    t.integer  "status_id"
    t.integer  "unit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "units", :force => true do |t|
    t.integer  "property_id"
    t.integer  "bedrooms"
    t.integer  "bathrooms"
    t.integer  "square_feet"
    t.integer  "base_rent"
    t.text     "amenities"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "image_url"
    t.boolean  "listed",      :default => false
    t.boolean  "rented",      :default => false
  end

  create_table "user_sessions", :force => true do |t|
    t.string   "username"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "username"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token",              :default => ""
    t.integer  "login_count"
    t.datetime "last_request_at"
    t.datetime "last_login_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type",                           :default => "Landlord"
    t.string   "status",            :limit => 1
    t.string   "phone_number"
    t.string   "perishable_token",               :default => "",         :null => false
    t.boolean  "verified",                       :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["perishable_token"], :name => "index_users_on_perishable_token"

end
