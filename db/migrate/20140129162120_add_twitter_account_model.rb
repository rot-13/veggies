class AddTwitterAccountModel < ActiveRecord::Migration
  def change
    create_table :twitter_accounts do |t|
      t.string :access_token
      t.string :access_secret
      t.references :veggie
      t.timestamps
    end
  end
end
