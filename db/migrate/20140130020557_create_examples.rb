class CreateExamples < ActiveRecord::Migration
  def change
    create_table :examples do |t|
      t.references :word, index: true
      t.text :text

      t.timestamps
    end
  end
end
