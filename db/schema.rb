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

ActiveRecord::Schema.define(:version => 20091015073241) do

  create_table "images", :force => true do |t|
    t.integer  "property_id",  :null => false
    t.integer  "parent_id"
    t.string   "content_type", :null => false
    t.string   "filename",     :null => false
    t.string   "thumbnail"
    t.integer  "size",         :null => false
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "properties", :force => true do |t|
    t.integer  "user_id"
    t.integer  "status_id"
    t.string   "name"
    t.float    "price"
    t.float    "sqf"
    t.integer  "beds"
    t.integer  "baths"
    t.string   "street_address"
    t.string   "city"
    t.integer  "zip"
    t.string   "state"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "property_images", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statuses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password"
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "is_agent"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
