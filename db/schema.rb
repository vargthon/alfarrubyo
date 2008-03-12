# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 10) do

  create_table "authors", :force => true do |t|
    t.string   "name",       :limit => 120, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "authors_books", :force => true do |t|
    t.integer "author_id"
    t.integer "book_id"
  end

  create_table "book_categories", :force => true do |t|
    t.string   "name",       :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "books", :force => true do |t|
    t.integer  "publisher_id"
    t.integer  "book_category_id"
    t.string   "title",            :limit => 100
    t.string   "isbn",             :limit => 40
    t.date     "released_at"
    t.integer  "edition"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "copies", :force => true do |t|
    t.integer  "book_id"
    t.integer  "copy_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "copies_loans", :force => true do |t|
    t.integer "loan_id"
    t.integer "copy_id"
  end

  create_table "customer_categories", :force => true do |t|
    t.string   "name",              :limit => 120
    t.integer  "max_allowed_books"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", :force => true do |t|
    t.string   "name",       :limit => 100, :null => false
    t.string   "phone",      :limit => 20
    t.string   "mobile",     :limit => 20
    t.string   "address",    :limit => 100
    t.string   "email",      :limit => 150
    t.string   "city",       :limit => 50
    t.boolean  "is_blocked"
    t.datetime "blocked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "loans", :force => true do |t|
    t.integer  "customer_id"
    t.datetime "borrowed_on"
    t.date     "due_at"
    t.float    "overdue_fee"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "publishers", :force => true do |t|
    t.string   "name",       :limit => 120
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
