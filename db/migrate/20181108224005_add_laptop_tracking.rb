class AddLaptopTracking < ActiveRecord::Migration[5.1]
  def change    
    create_table "laptimelogs", id: :serial, force: :cascade do |t|
      t.integer "user_id"
      t.datetime "timein"
      t.datetime "timeout"
      t.integer "time_logged"
      t.datetime "updated_at"
      t.integer "year_id"
      t.integer "week_id"
      t.integer "asset_id"
      t.index ["user_id"], name: "index_laptop_timelogs_on_user_id"
      t.index ["asset_id"], name: "index_laptop_timelogs_on_asset_id"
    end
  end
end
