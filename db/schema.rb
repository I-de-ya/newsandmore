# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120403092440) do

  create_table "admins", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true

  create_table "broadcasts", :force => true do |t|
    t.string   "title"
    t.datetime "showtime"
    t.integer  "sport_id"
    t.boolean  "visible",    :default => true
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "dish_categories", :force => true do |t|
    t.string   "name"
    t.integer  "section_id"
    t.integer  "position"
    t.boolean  "visible",    :default => true
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "dish_types", :force => true do |t|
    t.string   "title"
    t.integer  "price"
    t.integer  "dish_id"
    t.integer  "position"
    t.boolean  "visible",    :default => true
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "dishes", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "dish_category_id"
    t.boolean  "visible",          :default => true
    t.integer  "position"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  create_table "events", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.date     "date"
    t.string   "image_title"
    t.string   "image"
    t.boolean  "visible",     :default => true
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "images", :force => true do |t|
    t.string   "title"
    t.string   "image"
    t.integer  "section_id"
    t.boolean  "visible",    :default => true
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "messages", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "movies", :force => true do |t|
    t.string   "title"
    t.string   "origin"
    t.string   "genre"
    t.integer  "year"
    t.text     "description"
    t.string   "original_title"
    t.string   "director"
    t.string   "starring"
    t.string   "country"
    t.date     "premiere"
    t.time     "duration"
    t.datetime "showtime"
    t.string   "image"
    t.boolean  "visible",        :default => true
    t.string   "image_title"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "notes", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "image"
    t.boolean  "visible",     :default => true
    t.string   "image_title"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "recalls", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "body"
    t.boolean  "positiveness"
    t.boolean  "visible",      :default => true
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "reservations", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.integer  "persons"
    t.text     "comment"
    t.string   "phone"
    t.boolean  "smoke"
    t.integer  "hall"
    t.datetime "date_and_time"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "sections", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "position"
    t.boolean  "visible",    :default => true
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "sliders", :force => true do |t|
    t.text     "title"
    t.integer  "position"
    t.boolean  "visible"
    t.string   "slider_image"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "sports", :force => true do |t|
    t.string   "title"
    t.boolean  "visible",     :default => true
    t.string   "image"
    t.string   "image_title"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

end
