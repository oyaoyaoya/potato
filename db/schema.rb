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

ActiveRecord::Schema.define(version: 20170213062918) do

  create_table "contract_messages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "contract_id"
    t.integer  "user_id"
    t.text     "body",        limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["contract_id"], name: "index_contract_messages_on_contract_id", using: :btree
    t.index ["user_id"], name: "index_contract_messages_on_user_id", using: :btree
  end

  create_table "contracts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "item_id"
    t.integer  "purchaser_id"
    t.integer  "seller_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["item_id"], name: "index_contracts_on_item_id", using: :btree
    t.index ["purchaser_id", "seller_id"], name: "index_contracts_on_purchaser_id_and_seller_id", unique: true, using: :btree
    t.index ["purchaser_id"], name: "index_contracts_on_purchaser_id", using: :btree
    t.index ["seller_id"], name: "index_contracts_on_seller_id", using: :btree
  end

  create_table "courses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "university_department_id"
    t.string   "name"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["university_department_id"], name: "index_courses_on_university_department_id", using: :btree
  end

  create_table "departments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.text     "explanation", limit: 65535
    t.integer  "courses_id"
    t.boolean  "purchased",                 default: false
    t.boolean  "contract"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.index ["courses_id"], name: "index_items_on_courses_id", using: :btree
  end

  create_table "universities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "university_departments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "university_id"
    t.integer  "department_id"
    t.text     "name",          limit: 65535
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["department_id"], name: "index_university_departments_on_department_id", using: :btree
    t.index ["university_id"], name: "index_university_departments_on_university_id", using: :btree
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
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "contract_messages", "contracts"
  add_foreign_key "contract_messages", "users"
  add_foreign_key "contracts", "items"
  add_foreign_key "courses", "university_departments"
  add_foreign_key "item_comments", "items"
  add_foreign_key "item_comments", "users"
  add_foreign_key "item_likes", "items"
  add_foreign_key "item_likes", "users"
  add_foreign_key "items", "courses", column: "courses_id"
  add_foreign_key "university_departments", "departments"
  add_foreign_key "university_departments", "universities"
  add_foreign_key "user_evaluations", "items"
end
