class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :author
      t.string :title
      t.string :sku
      t.decimal :price
      t.integer :stock
      t.boolean :reqopt
      t.string :term
      t.integer :book_id
      t.references :courses, foreign_key: true

      t.timestamps
    end
  end
end
