
ActiveRecord::Schema.define(version: 2019_05_01_175543) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blobs_id"], name: "index_active_storage_attachments_on_blobs_id"
    t.index ["record_type", "record_id", "name", "blobs_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_products", force: :cascade do |t|
    t.integer "quantity"
    t.text "comment"
    t.integer "orders_id"
    t.integer "products_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["orders_id"], name: "index_order_products_on_order_id"
    t.index ["products_id"], name: "index_order_products_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "name"
    t.string "phone_number"
    t.float "total_value"
    t.string "address"
    t.integer "status", default: 0
    t.integer "restaurants_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurants_id"], name: "index_orders_on_restaurant_id"
  end

  create_table "product_categories", force: :cascade do |t|
    t.string "title"
    t.integer "restaurants_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurants_id"], name: "index_product_categories_on_restaurant_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.float "price"
    t.integer "product_categories_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_categories_id"], name: "index_products_on_product_categories_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "status"
    t.float "delivery_tax"
    t.string "state"
    t.string "city"
    t.string "street"
    t.string "neighborhood"
    t.string "number"
    t.string "complement"
    t.string "reference"
    t.string "cep"
    t.float "latitude"
    t.float "longitude"
    t.integer "categories_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["categories_id"], name: "index_restaurants_on_categories_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "value"
    t.integer "restaurants_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurants_id"], name: "index_reviews_on_restaurant_id"
  end

end
