class CreateQuizLists < ActiveRecord::Migration
  def change
    create_table :quiz_lists do |t|
      t.references :list, index: true
      t.references :quiz, index: true

      t.timestamps
    end
  end
end
