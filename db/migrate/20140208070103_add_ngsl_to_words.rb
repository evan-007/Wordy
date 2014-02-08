class AddNgslToWords < ActiveRecord::Migration
  def change
    add_column :words, :ngsl, :boolean, default: false
  end
end
