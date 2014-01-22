class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.belongs_to :veggie
      t.integer :primary_price
      t.integer :secondary_price
      t.timestamps
    end
  end
end
