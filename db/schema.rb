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

ActiveRecord::Schema.define(version: 20170318024302) do

  create_table "contracts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "item_id"
    t.integer  "purchaser_id"
    t.integer  "seller_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "status",       default: 0, null: false
    t.index ["item_id"], name: "index_contracts_on_item_id", using: :btree
    t.index ["purchaser_id"], name: "index_contracts_on_purchaser_id", using: :btree
    t.index ["seller_id"], name: "index_contracts_on_seller_id", using: :btree
  end

  create_table "courses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "text_presence", limit: 1, default: 0, null: false
    t.integer  "period",        limit: 1, default: 0, null: false
    t.integer  "day",           limit: 1, default: 0, null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "professor_id"
    t.index ["professor_id"], name: "index_courses_on_professor_id", using: :btree
  end

  create_table "department_and_courses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "department_id"
    t.integer  "course_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["course_id"], name: "index_department_and_courses_on_course_id", using: :btree
    t.index ["department_id"], name: "index_department_and_courses_on_department_id", using: :btree
  end

  create_table "departments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "school_id"
    t.integer  "source_department_id"
    t.string   "name"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "faculty_id"
    t.index ["faculty_id"], name: "index_departments_on_faculty_id", using: :btree
    t.index ["school_id"], name: "index_departments_on_school_id", using: :btree
    t.index ["source_department_id"], name: "index_departments_on_source_department_id", using: :btree
  end

  create_table "faculties", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "school_id"
    t.integer  "source_faculty_id"
    t.string   "name"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["school_id"], name: "index_faculties_on_school_id", using: :btree
    t.index ["source_faculty_id"], name: "index_faculties_on_source_faculty_id", using: :btree
  end

  create_table "faculty_and_courses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "faculty_id"
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_faculty_and_courses_on_course_id", using: :btree
    t.index ["faculty_id"], name: "index_faculty_and_courses_on_faculty_id", using: :btree
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
    t.boolean  "contract",    default: false
    t.integer  "seller_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
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
    t.integer  "school_type", limit: 1, default: 0, null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "source_departments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "source_faculties", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "textbooks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "price"
    t.text     "explanation", limit: 65535
    t.integer  "course_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
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
    t.string   "name"
    t.index ["department_id"], name: "index_users_on_department_id", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["faculty_id"], name: "index_users_on_faculty_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["school_id"], name: "index_users_on_school_id", using: :btree
  end

  add_foreign_key "contracts", "items"
  add_foreign_key "contracts", "users", column: "purchaser_id"
  add_foreign_key "contracts", "users", column: "seller_id"
  add_foreign_key "courses", "professors"
  add_foreign_key "department_and_courses", "courses"
  add_foreign_key "department_and_courses", "departments"
  add_foreign_key "departments", "faculties"
  add_foreign_key "departments", "schools"
  add_foreign_key "departments", "source_departments"
  add_foreign_key "faculties", "schools"
  add_foreign_key "faculties", "source_faculties"
  add_foreign_key "faculty_and_courses", "courses"
  add_foreign_key "faculty_and_courses", "faculties"
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
  add_foreign_key "textbooks", "courses"
  add_foreign_key "user_evaluations", "items"
  add_foreign_key "users", "departments"
  add_foreign_key "users", "faculties"
  add_foreign_key "users", "schools"
end
