class CreateVeggies < ActiveRecord::Migration
  def change
    create_table :veggies do |t|
      t.string :eng_name
      t.string :heb_name
      t.timestamps
    end
  end
end
