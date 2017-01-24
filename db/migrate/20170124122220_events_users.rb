class EventsUsers < ActiveRecord::Migration
  def change
    create_table :events_users, id: false do |t|
      t.string :event_id, index: true
      t.string :user_id,  index: true
    end
  end
end
