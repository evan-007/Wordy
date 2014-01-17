class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :name
      t.text :definition
      t.string :pos
      t.string :ipa

      t.timestamps
    end
  end
end
