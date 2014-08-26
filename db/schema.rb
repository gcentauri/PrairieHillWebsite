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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140826135725) do

  create_table "activities", force: true do |t|
    t.string   "work_area"
    t.string   "coordinator"
    t.boolean  "sign"
    t.integer  "num_tickets"
    t.string   "vol_needed"
    t.text     "shift_ids"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "comments"
  end

  create_table "comfy_cms_blocks", force: true do |t|
    t.string   "identifier",                      null: false
    t.text     "content",        limit: 16777215
    t.integer  "blockable_id"
    t.string   "blockable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comfy_cms_blocks", ["blockable_id", "blockable_type"], name: "index_comfy_cms_blocks_on_blockable_id_and_blockable_type"
  add_index "comfy_cms_blocks", ["identifier"], name: "index_comfy_cms_blocks_on_identifier"

  create_table "comfy_cms_categories", force: true do |t|
    t.integer "site_id",          null: false
    t.string  "label",            null: false
    t.string  "categorized_type", null: false
  end

  add_index "comfy_cms_categories", ["site_id", "categorized_type", "label"], name: "index_cms_categories_on_site_id_and_cat_type_and_label", unique: true

  create_table "comfy_cms_categorizations", force: true do |t|
    t.integer "category_id",      null: false
    t.string  "categorized_type", null: false
    t.integer "categorized_id",   null: false
  end

  add_index "comfy_cms_categorizations", ["category_id", "categorized_type", "categorized_id"], name: "index_cms_categorizations_on_cat_id_and_catd_type_and_catd_id", unique: true

  create_table "comfy_cms_files", force: true do |t|
    t.integer  "site_id",                                    null: false
    t.integer  "block_id"
    t.string   "label",                                      null: false
    t.string   "file_file_name",                             null: false
    t.string   "file_content_type",                          null: false
    t.integer  "file_file_size",                             null: false
    t.string   "description",       limit: 2048
    t.integer  "position",                       default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comfy_cms_files", ["site_id", "block_id"], name: "index_comfy_cms_files_on_site_id_and_block_id"
  add_index "comfy_cms_files", ["site_id", "file_file_name"], name: "index_comfy_cms_files_on_site_id_and_file_file_name"
  add_index "comfy_cms_files", ["site_id", "label"], name: "index_comfy_cms_files_on_site_id_and_label"
  add_index "comfy_cms_files", ["site_id", "position"], name: "index_comfy_cms_files_on_site_id_and_position"

  create_table "comfy_cms_layouts", force: true do |t|
    t.integer  "site_id",                                     null: false
    t.integer  "parent_id"
    t.string   "app_layout"
    t.string   "label",                                       null: false
    t.string   "identifier",                                  null: false
    t.text     "content",    limit: 16777215
    t.text     "css",        limit: 16777215
    t.text     "js",         limit: 16777215
    t.integer  "position",                    default: 0,     null: false
    t.boolean  "is_shared",                   default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comfy_cms_layouts", ["parent_id", "position"], name: "index_comfy_cms_layouts_on_parent_id_and_position"
  add_index "comfy_cms_layouts", ["site_id", "identifier"], name: "index_comfy_cms_layouts_on_site_id_and_identifier", unique: true

  create_table "comfy_cms_pages", force: true do |t|
    t.integer  "site_id",                                         null: false
    t.integer  "layout_id"
    t.integer  "parent_id"
    t.integer  "target_page_id"
    t.string   "label",                                           null: false
    t.string   "slug"
    t.string   "full_path",                                       null: false
    t.text     "content_cache",  limit: 16777215
    t.integer  "position",                        default: 0,     null: false
    t.integer  "children_count",                  default: 0,     null: false
    t.boolean  "is_published",                    default: true,  null: false
    t.boolean  "is_shared",                       default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comfy_cms_pages", ["parent_id", "position"], name: "index_comfy_cms_pages_on_parent_id_and_position"
  add_index "comfy_cms_pages", ["site_id", "full_path"], name: "index_comfy_cms_pages_on_site_id_and_full_path"

  create_table "comfy_cms_revisions", force: true do |t|
    t.string   "record_type",                  null: false
    t.integer  "record_id",                    null: false
    t.text     "data",        limit: 16777215
    t.datetime "created_at"
  end

  add_index "comfy_cms_revisions", ["record_type", "record_id", "created_at"], name: "index_cms_revisions_on_rtype_and_rid_and_created_at"

  create_table "comfy_cms_sites", force: true do |t|
    t.string  "label",                       null: false
    t.string  "identifier",                  null: false
    t.string  "hostname",                    null: false
    t.string  "path"
    t.string  "locale",      default: "en",  null: false
    t.boolean "is_mirrored", default: false, null: false
  end

  add_index "comfy_cms_sites", ["hostname"], name: "index_comfy_cms_sites_on_hostname"
  add_index "comfy_cms_sites", ["is_mirrored"], name: "index_comfy_cms_sites_on_is_mirrored"

  create_table "comfy_cms_snippets", force: true do |t|
    t.integer  "site_id",                                     null: false
    t.string   "label",                                       null: false
    t.string   "identifier",                                  null: false
    t.text     "content",    limit: 16777215
    t.integer  "position",                    default: 0,     null: false
    t.boolean  "is_shared",                   default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comfy_cms_snippets", ["site_id", "identifier"], name: "index_comfy_cms_snippets_on_site_id_and_identifier", unique: true
  add_index "comfy_cms_snippets", ["site_id", "position"], name: "index_comfy_cms_snippets_on_site_id_and_position"

  create_table "pages", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "index"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shifts", force: true do |t|
    t.string   "title"
    t.string   "time"
    t.integer  "vols_needed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "volunteers",  default: "[]"
    t.string   "volunteer"
    t.string   "guest"
  end

  add_index "shifts", ["guest"], name: "index_shifts_on_guest"

  create_table "shifts_users", force: true do |t|
    t.integer "shift_id"
    t.integer "user_id"
  end

  create_table "shifts_volunteers", id: false, force: true do |t|
    t.integer "volunteer_id"
    t.integer "product_id"
    t.integer "shift_id"
  end

  add_index "shifts_volunteers", ["shift_id"], name: "index_shifts_volunteers_on_shift_id"

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "name"
    t.boolean  "admin",                  default: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
  end

  add_index "users", ["admin"], name: "index_users_on_admin"
  add_index "users", ["email"], name: "index_users_on_email"
  add_index "users", ["first_name"], name: "index_users_on_first_name"
  add_index "users", ["last_name"], name: "index_users_on_last_name"
  add_index "users", ["phone"], name: "index_users_on_phone"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

  create_table "users_shifts", force: true do |t|
    t.integer "user_id"
    t.integer "shift_id"
  end

  create_table "volunteers", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "volunteers_shifts", id: false, force: true do |t|
    t.integer "volunteer_id"
    t.integer "product_id"
  end

end
