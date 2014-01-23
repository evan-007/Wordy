class CreateQuizWords < ActiveRecord::Migration
  def change
    create_table :quiz_words do |t|
      t.references :word
      t.references :quiz

      t.timestamps
    end
  end
end
