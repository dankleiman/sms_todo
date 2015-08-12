
class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :from
      t.text :message_body
      t.datetime :completed_at

      t.timestamps null: false
    end
  end
end
