class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.belongs_to :authors, foreign_key: true
      t.string :title
      t.string :description
      t.string :book_language
      t.integer :publication_year
      t.string :publisher
      t.string :isbn
      t.integer :page_count
      t.integer :price
      t.boolean :availability
      t.integer :rating

      t.timestamps
    end
  end
end
