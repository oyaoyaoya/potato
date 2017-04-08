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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170406025618) do

  create_table "contracts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "item_id"
    t.integer  "purchaser_id"
    t.integer  "seller_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "status",       default: 0, null: false
    t.integer  "complete_id"
    t.index ["item_id"], name: "index_contracts_on_item_id", using: :btree
    t.index ["purchaser_id"], name: "index_contracts_on_purchaser_id", using: :btree
    t.index ["seller_id"], name: "index_contracts_on_seller_id", using: :btree
  end

  create_table "courses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "faculty_id"
    t.integer  "department_id"
    t.integer  "school_id"
    t.integer  "text_presence",  limit: 1,     default: 0, null: false
    t.bigint   "period",                       default: 0, null: false
    t.bigint   "day",                          default: 0, null: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "professor_id"
    t.string   "course_num"
    t.integer  "hold_year"
    t.string   "info"
    t.string   "professor_name"
    t.integer  "term",                         default: 0, null: false
    t.text     "url",            limit: 65535
    t.integer  "course_status"
    t.index ["department_id"], name: "index_courses_on_department_id", using: :btree
    t.index ["faculty_id"], name: "index_courses_on_faculty_id", using: :btree
    t.index ["professor_id"], name: "index_courses_on_professor_id", using: :btree
    t.index ["school_id"], name: "index_courses_on_school_id", using: :btree
  end

  create_table "csv_counters", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "csv_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "school_id"
    t.integer  "faculty_id"
    t.string   "name"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "department_status"
    t.index ["faculty_id"], name: "index_departments_on_faculty_id", using: :btree
    t.index ["school_id"], name: "index_departments_on_school_id", using: :btree
  end

  create_table "faculties", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "school_id"
    t.string   "name"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "faculty_status"
    t.index ["school_id"], name: "index_faculties_on_school_id", using: :btree
  end

  create_table "item_comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.text     "body",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["item_id"], name: "index_item_comments_on_item_id", using: :btree
    t.index ["user_id"], name: "index_item_comments_on_user_id", using: :btree
  end

  create_table "item_likes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "item_id"
    t.integer  "user_id"
    t.boolean  "like"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_item_likes_on_item_id", using: :btree
    t.index ["user_id"], name: "index_item_likes_on_user_id", using: :btree
  end

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "price"
    t.integer  "status"
    t.integer  "textbook_id"
    t.integer  "course_id"
    t.boolean  "purchased",             default: false
    t.integer  "seller_id"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "item_type"
    t.boolean  "published",             default: true,  null: false
    t.integer  "delivery",    limit: 2,                 null: false
    t.index ["course_id"], name: "index_items_on_course_id", using: :btree
    t.index ["seller_id"], name: "index_items_on_seller_id", using: :btree
    t.index ["textbook_id"], name: "index_items_on_textbook_id", using: :btree
  end

  create_table "messages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "contract_id"
    t.integer  "user_id"
    t.text     "body",        limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["contract_id"], name: "index_messages_on_contract_id", using: :btree
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "professors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "faculty_id"
    t.integer  "department_id"
    t.integer  "school_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["department_id"], name: "index_professors_on_department_id", using: :btree
    t.index ["faculty_id"], name: "index_professors_on_faculty_id", using: :btree
    t.index ["school_id"], name: "index_professors_on_school_id", using: :btree
  end

  create_table "schools", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "school_type",   limit: 1, default: 0, null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "school_status"
  end

  create_table "text_counts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "info",        limit: 65535
    t.string   "name"
    t.integer  "course_id"
    t.string   "text_length"
    t.string   "text_byte"
    t.text     "text_lines",  limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["course_id"], name: "index_text_counts_on_course_id", using: :btree
  end

  create_table "text_infos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "info",       limit: 65535
    t.string   "name"
    t.integer  "course_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["course_id"], name: "index_text_infos_on_course_id", using: :btree
  end

  create_table "textbooks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "price"
    t.text     "explanation",     limit: 65535
    t.integer  "course_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "author"
    t.string   "publisher"
    t.string   "published_year"
    t.string   "isbn_10"
    t.string   "isbn_13"
    t.string   "issn_13"
    t.string   "book_code"
    t.text     "url",             limit: 65535
    t.integer  "textbook_status"
    t.text     "small_thumbnail", limit: 65535
    t.text     "thumbnail",       limit: 65535
    t.text     "info_link",       limit: 65535
    t.index ["course_id"], name: "index_textbooks_on_course_id", using: :btree
  end

  create_table "user_evaluations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "purchaser_id"
    t.integer  "seller_id"
    t.integer  "item_id"
    t.integer  "evaluation"
    t.text     "evalation_body", limit: 65535
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["item_id"], name: "index_user_evaluations_on_item_id", using: :btree
    t.index ["purchaser_id"], name: "index_user_evaluations_on_purchaser_id", using: :btree
    t.index ["seller_id"], name: "index_user_evaluations_on_seller_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "completed",              default: false, null: false
    t.integer  "school_id"
    t.integer  "department_id"
    t.integer  "faculty_id"
    t.integer  "grade"
    t.string   "name"
    t.string   "provider"
    t.string   "uid"
    t.string   "meta"
    t.string   "token"
    t.integer  "user_status"
    t.index ["department_id"], name: "index_users_on_department_id", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["faculty_id"], name: "index_users_on_faculty_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["school_id"], name: "index_users_on_school_id", using: :btree
  end

  add_foreign_key "contracts", "items"
  add_foreign_key "contracts", "users", column: "purchaser_id"
  add_foreign_key "contracts", "users", column: "seller_id"
  add_foreign_key "courses", "departments"
  add_foreign_key "courses", "faculties"
  add_foreign_key "courses", "professors"
  add_foreign_key "courses", "schools"
  add_foreign_key "departments", "faculties"
  add_foreign_key "departments", "schools"
  add_foreign_key "faculties", "schools"
  add_foreign_key "item_comments", "items"
  add_foreign_key "item_comments", "users"
  add_foreign_key "item_likes", "items"
  add_foreign_key "item_likes", "users"
  add_foreign_key "items", "courses"
  add_foreign_key "items", "textbooks"
  add_foreign_key "items", "users", column: "seller_id"
  add_foreign_key "messages", "contracts"
  add_foreign_key "messages", "users"
  add_foreign_key "professors", "departments"
  add_foreign_key "professors", "faculties"
  add_foreign_key "professors", "schools"
  add_foreign_key "text_counts", "courses"
  add_foreign_key "text_infos", "courses"
  add_foreign_key "textbooks", "courses"
  add_foreign_key "user_evaluations", "items"
  add_foreign_key "users", "departments"
  add_foreign_key "users", "faculties"
  add_foreign_key "users", "schools"
end
