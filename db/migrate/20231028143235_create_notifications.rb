class CreateNotifications < ActiveRecord::Migration[7.1]
  def change
    create_table :notifications do |t|
      t.string :notification_type
      t.boolean :is_sent
      t.text :metadata

      t.timestamps
    end
  end
end
