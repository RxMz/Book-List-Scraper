class CreateBookLists < ActiveRecord::Migration[5.2]
  def change
    create_table :book_lists do |t|
      t.references :term # initially it was over here
      t.timestamps

    end
  end
end
