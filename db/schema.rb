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

ActiveRecord::Schema.define(:version => 20080727025707) do

  create_table "adminusers", :force => true do |t|
    t.string "Name"
    t.string "Hashed_Password"
    t.string "Salt"
  end

  create_table "areas", :force => true do |t|
    t.string  "Name"
    t.string  "Leaf"
    t.integer "Order", :limit => 11
  end

# Could not dump table "categories" because of following StandardError
#   Unknown type 'bit(1)' for column 'IsShow'

  create_table "comments", :force => true do |t|
    t.integer  "EntId",      :limit => 11
    t.string   "Content"
    t.string   "FromIP"
    t.datetime "CreateTime"
    t.integer  "Type",       :limit => 11
    t.integer  "Status",     :limit => 11
  end

  create_table "enterprises", :primary_key => "Id", :force => true do |t|
    t.string  "EntName"
    t.integer "CategoryId",     :limit => 11
    t.string  "CategoryLeft"
    t.string  "Expenses"
    t.string  "Trade"
    t.string  "EntType"
    t.string  "RegisterTime"
    t.string  "Address"
    t.string  "ZipCode"
    t.string  "LinkTel"
    t.string  "LinkFax"
    t.string  "Email"
    t.string  "RegisteredFund"
    t.string  "Turnover"
    t.string  "AllPoples"
    t.string  "Keywords"
    t.string  "Area"
    t.integer "ShowFirst",      :limit => 11
    t.integer "GoodNumber",     :limit => 11
    t.integer "BadNumber",      :limit => 11
    t.integer "FromId",         :limit => 11
    t.integer "StatusId",       :limit => 11
    t.date    "CreateTime"
    t.date    "UpdateTime"
    t.string  "FromIP"
  end

end
