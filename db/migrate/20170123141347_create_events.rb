class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string   :name,                null: false
      t.string   :place,               null: false
      t.datetime :date_time,           null: false
      t.text     :purpose,             null: false
      t.integer  :max_visitors_number, null: false, default: 2

      t.timestamps null: false
    end
  end
end