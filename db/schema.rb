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

ActiveRecord::Schema.define(version: 50_161_230_223_302) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'active_storage_attachments', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'record_type', null: false
    t.bigint 'record_id', null: false
    t.bigint 'blob_id', null: false
    t.datetime 'created_at', null: false
    t.index ['blob_id'], name: 'index_active_storage_attachments_on_blob_id'
    t.index %w[record_type record_id name blob_id], name: 'index_active_storage_attachments_uniqueness', unique: true
  end

  create_table 'active_storage_blobs', force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.bigint 'byte_size', null: false
    t.string 'checksum', null: false
    t.datetime 'created_at', null: false
    t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
  end

  create_table 'country_of_origins', force: :cascade do |t|
    t.string 'name'
    t.string 'ctype'
    t.datetime 'fdate'
    t.integer 'active_status'
    t.integer 'sort_order'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'examples', force: :cascade do |t|
    t.string 'name'
    t.string 'color'
    t.integer 'active_status'
    t.integer 'sort_order'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'pfeatures', force: :cascade do |t|
    t.string 'name'
    t.datetime 'fdate'
    t.integer 'active_status'
    t.integer 'sort_order'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'product_features', force: :cascade do |t|
    t.string 'name'
    t.bigint 'product_id'
    t.bigint 'pfeature_id'
    t.integer 'active_status'
    t.integer 'sort_order'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['pfeature_id'], name: 'index_product_features_on_pfeature_id'
    t.index ['product_id'], name: 'index_product_features_on_product_id'
  end

  create_table 'products', force: :cascade do |t|
    t.string 'name'
    t.string 'pcolor'
    t.bigint 'country_of_origin_id'
    t.datetime 'pdate'
    t.integer 'active_status'
    t.integer 'sort_order'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['country_of_origin_id'], name: 'index_products_on_country_of_origin_id'
  end

  create_table 'roles', force: :cascade do |t|
    t.string 'name'
    t.string 'description'
    t.integer 'active_status'
    t.integer 'sort_order'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'confirmation_token'
    t.datetime 'confirmed_at'
    t.datetime 'confirmation_sent_at'
    t.string 'unconfirmed_email'
    t.integer 'failed_attempts', default: 0, null: false
    t.string 'unlock_token'
    t.datetime 'locked_at'
    t.string 'name'
    t.integer 'role_id', default: 1
    t.integer 'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.inet 'current_sign_in_ip'
    t.inet 'last_sign_in_ip'
    t.index ['confirmation_token'], name: 'index_users_on_confirmation_token', unique: true
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
    t.index ['role_id'], name: 'index_users_on_role_id'
    t.index ['unlock_token'], name: 'index_users_on_unlock_token', unique: true
  end

  create_table 'versions', force: :cascade do |t|
    t.string 'item_type', null: false
    t.bigint 'item_id', null: false
    t.string 'event', null: false
    t.string 'whodunnit'
    t.text 'object'
    t.datetime 'created_at'
    t.text 'object_changes'
    t.index %w[item_type item_id], name: 'index_versions_on_item_type_and_item_id'
  end

  add_foreign_key 'active_storage_attachments', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'product_features', 'pfeatures'
  add_foreign_key 'product_features', 'products'
  add_foreign_key 'products', 'country_of_origins'
  add_foreign_key 'users', 'roles'
end
