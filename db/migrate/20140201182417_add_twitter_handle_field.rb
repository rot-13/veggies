class AddTwitterHandleField < ActiveRecord::Migration
  def change
    change_table :twitter_accounts do |t|
      t.string :handle
    end
  end
end
