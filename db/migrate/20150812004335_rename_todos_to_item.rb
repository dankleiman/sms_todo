class RenameTodosToItem < ActiveRecord::Migration
  def change
    rename_table :todos, :items
  end
end
