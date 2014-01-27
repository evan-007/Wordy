class AddCorrectToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :correct, :boolean, default: false
  end
end
