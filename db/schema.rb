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

ActiveRecord::Schema.define(:version => 20111111173541) do

  create_table "comments", :force => true do |t|
    t.string    "commenter"
    t.text      "body"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.integer   "name_id"
  end

  create_table "names", :force => true do |t|
    t.string    "name"
    t.integer   "votes",      :default => 0
    t.string    "status",     :default => "active"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

end
