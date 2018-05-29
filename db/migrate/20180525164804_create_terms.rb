class CreateTerms < ActiveRecord::Migration[5.2]
  def change
    create_table :terms do |t|
      t.integer :term_code
      t.string :term_description

      t.timestamps
    end
  end
end
