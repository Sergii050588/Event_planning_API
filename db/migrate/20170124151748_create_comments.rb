class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments, id: false, primary_key: :id do |t|
      t.string :id, primary_key: true
      t.string :user_id, null: false
      t.string :event_id, null: false
      t.text :note

      t.timestamps null: false
    end
  end
end
