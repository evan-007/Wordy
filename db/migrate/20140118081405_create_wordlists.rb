class CreateWordlists < ActiveRecord::Migration
  def change
    create_table :wordlists do |t|
      t.belongs_to :word
      t.belongs_to :list

      t.timestamps
    end
  end
end
