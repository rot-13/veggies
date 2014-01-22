class AddBasicIndices < ActiveRecord::Migration
  def change
    add_index :veggies, :heb_name
    add_index :prices, :created_at
  end
end
