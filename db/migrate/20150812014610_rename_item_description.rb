class RenameItemDescription < ActiveRecord::Migration
  def change
    rename_column :items, :message_body, :description
  end
end
