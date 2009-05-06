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

ActiveRecord::Schema.define(:version => 20090506160506) do

  create_table "areas", :force => true do |t|
    t.string   "area_name",  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "areas", ["area_name"], :name => "index_areas_on_area_name"

  create_table "areas_themes", :id => false, :force => true do |t|
    t.integer "area_id"
    t.integer "theme_id"
  end

  add_index "areas_themes", ["area_id", "theme_id"], :name => "index_areas_themes_on_area_id_and_theme_id"

  create_table "avtoref_docs", :force => true do |t|
    t.string   "adoc_file_name"
    t.string   "adoc_content_type"
    t.integer  "adoc_file_size"
    t.integer  "ipaper_id"
    t.string   "ipaper_access_key"
    t.integer  "theme_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "avtoref_docs", ["adoc_file_name"], :name => "index_avtoref_docs_on_adoc_file_name"
  add_index "avtoref_docs", ["ipaper_access_key", "ipaper_id"], :name => "index_avtoref_docs_on_ipaper_access_key_and_ipaper_id"
  add_index "avtoref_docs", ["theme_id"], :name => "index_avtoref_docs_on_theme_id"

  create_table "avtoref_pdfs", :force => true do |t|
    t.string   "apdf_file_name"
    t.string   "apdf_content_type"
    t.integer  "apdf_file_size"
    t.integer  "ipaper_id"
    t.string   "ipaper_access_key"
    t.integer  "theme_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "avtoref_pdfs", ["apdf_file_name"], :name => "index_avtoref_pdfs_on_apdf_file_name"
  add_index "avtoref_pdfs", ["ipaper_access_key", "ipaper_id"], :name => "index_avtoref_pdfs_on_ipaper_access_key_and_ipaper_id"
  add_index "avtoref_pdfs", ["theme_id"], :name => "index_avtoref_pdfs_on_theme_id"

  create_table "disser_docs", :force => true do |t|
    t.string   "ddoc_file_name"
    t.string   "ddoc_content_type"
    t.integer  "ddoc_file_size"
    t.integer  "ipaper_id"
    t.string   "ipaper_access_key"
    t.integer  "theme_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "disser_docs", ["ddoc_file_name"], :name => "index_disser_docs_on_ddoc_file_name"
  add_index "disser_docs", ["ipaper_access_key", "ipaper_id"], :name => "index_disser_docs_on_ipaper_access_key_and_ipaper_id"
  add_index "disser_docs", ["theme_id"], :name => "index_disser_docs_on_theme_id"

  create_table "disser_pdfs", :force => true do |t|
    t.string   "dpdf_file_name"
    t.string   "dpdf_content_type"
    t.integer  "dpdf_file_size"
    t.integer  "ipaper_id"
    t.string   "ipaper_access_key"
    t.integer  "theme_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "disser_pdfs", ["dpdf_file_name"], :name => "index_disser_pdfs_on_dpdf_file_name"
  add_index "disser_pdfs", ["ipaper_access_key", "ipaper_id"], :name => "index_disser_pdfs_on_ipaper_access_key_and_ipaper_id"
  add_index "disser_pdfs", ["theme_id"], :name => "index_disser_pdfs_on_theme_id"

  create_table "grades", :force => true do |t|
    t.string   "grade_name", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "grades", ["grade_name"], :name => "index_grades_on_grade_name"

  create_table "organizations", :force => true do |t|
    t.string   "organization_name", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "organizations", ["organization_name"], :name => "index_organizations_on_organization_name"

  create_table "professions", :force => true do |t|
    t.string   "profession_name", :null => false
    t.string   "code_name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "professions", ["profession_name", "code_name"], :name => "index_professions_on_profession_name_and_code_name"

  create_table "professions_themes", :id => false, :force => true do |t|
    t.integer "profession_id"
    t.integer "theme_id"
  end

  add_index "professions_themes", ["profession_id", "theme_id"], :name => "index_professions_themes_on_profession_id_and_theme_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "subareas", :force => true do |t|
    t.string   "subarea_name", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subareas", ["subarea_name"], :name => "index_subareas_on_subarea_name"

  create_table "subareas_themes", :id => false, :force => true do |t|
    t.integer "subarea_id"
    t.integer "theme_id"
  end

  add_index "subareas_themes", ["subarea_id", "theme_id"], :name => "index_subareas_themes_on_subarea_id_and_theme_id"

  create_table "themes", :force => true do |t|
    t.string   "theme_name",      :null => false
    t.string   "fio",             :null => false
    t.string   "year_name",       :null => false
    t.text     "text_avtoref"
    t.text     "text_disser"
    t.integer  "organization_id", :null => false
    t.integer  "grade_id",        :null => false
    t.boolean  "delta"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "themes", ["grade_id"], :name => "index_themes_on_grade_id"
  add_index "themes", ["organization_id"], :name => "index_themes_on_organization_id"
  add_index "themes", ["theme_name", "fio"], :name => "index_themes_on_theme_name_and_fio"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "encrypted_password", :limit => 128
    t.string   "salt",               :limit => 128
    t.string   "token",              :limit => 128
    t.datetime "token_expires_at"
    t.boolean  "email_confirmed",                   :default => false, :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["id", "token"], :name => "index_users_on_id_and_token"
  add_index "users", ["token"], :name => "index_users_on_token"

end
