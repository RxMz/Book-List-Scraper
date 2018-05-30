class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :instructors
      t.string :sections
      t.string :department
      t.integer :number
      t.string :term
     # t.integer :book_list, foreign_key: true,
      t.references :book_list , foreign_key: true

      t.timestamps
    end
  end
end
  