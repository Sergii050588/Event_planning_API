class CreateFileAttachments < ActiveRecord::Migration
  def change
    create_table :file_attachments do |t|
      t.string :file
      t.string :event_id

      t.timestamps null: false
    end
  end
end
