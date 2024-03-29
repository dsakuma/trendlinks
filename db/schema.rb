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

ActiveRecord::Schema.define(:version => 20101017072315) do

  create_table "currents", :force => true do |t|
    t.string   "resolved_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "last_hours", :force => true do |t|
    t.string   "resolved_url"
    t.integer  "count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "last_ids", :force => true do |t|
    t.integer  "last_id",    :limit => 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "last_six_top", :id => false, :force => true do |t|
    t.integer "id",                                                 :default => 0, :null => false
    t.string  "url"
    t.integer "count", :limit => 32, :precision => 32, :scale => 0
  end

  create_table "resolveds", :force => true do |t|
    t.string   "resolved_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shorters", :force => true do |t|
    t.string   "short_url"
    t.integer  "current_id"
    t.integer  "count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shorts", :force => true do |t|
    t.string   "url"
    t.integer  "resolved_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tops", :id => false, :force => true do |t|
    t.integer "id",                                                 :default => 0, :null => false
    t.string  "url"
    t.integer "count", :limit => 32, :precision => 32, :scale => 0
  end

end
