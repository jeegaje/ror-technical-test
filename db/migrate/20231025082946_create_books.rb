class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :authors do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
    create_table :books do |t|
      t.belongs_to :authors, foreign_key: true
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
