class CreateWordCategories < ActiveRecord::Migration
  def change
    create_table :word_categories do |t|
      t.references :word
      t.references :category

      t.timestamps
    end
  end
end
