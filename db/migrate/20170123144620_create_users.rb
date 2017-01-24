class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, id: false, primary_key: :id do |t|
      t.string   :id,     null: false, primary_key: true
      t.string   :provider
      t.string   :uid
      t.string   :name
      t.string   :oauth_token
      t.datetime :oauth_expires_at

      t.timestamps null: false
    end
  end
end
