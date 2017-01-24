class AddFilesToEvents < ActiveRecord::Migration
  def change
    add_column :events, :files, :json
  end
end
