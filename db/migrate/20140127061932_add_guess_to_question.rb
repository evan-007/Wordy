class AddGuessToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :guess, :string
  end
end
