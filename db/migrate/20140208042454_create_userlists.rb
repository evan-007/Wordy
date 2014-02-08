class CreateUserlists < ActiveRecord::Migration
  def change
    create_table :userlists do |t|
      t.references :user, index: true
      t.references :list, index: true

      t.timestamps
    end
  end
end
