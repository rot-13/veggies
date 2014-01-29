class AddPropertiesToVeggies < ActiveRecord::Migration
  def change
    add_column :veggies, :color, :string
    add_column :veggies, :icon, :string
    add_column :veggies, :weight, :integer
  end
end
