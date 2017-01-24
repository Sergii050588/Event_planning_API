class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events, id: false, primary_key: :id do |t|
      t.string   :id, null: false, primary_key: true
      t.string   :name
      t.string   :place
      t.datetime :date_time
      t.text     :purpose
      t.integer  :max_visitors_number, null: false, default: 2

      t.timestamps null: false
    end
  end
end
