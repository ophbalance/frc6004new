class CreateComputers < ActiveRecord::Migration[5.1]
  def change
    create_table :computers do |t|
      t.string "name"
      t.integer "asset_id"
      t.boolean "archive", default: false, null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["asset_id"], name: "index_asset_id"
    end
  end
end
