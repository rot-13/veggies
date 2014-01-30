class AddHashTagsToTwitterAccount < ActiveRecord::Migration
  def change
    change_table :twitter_accounts do |t|
      t.string :hash_tags, array: true, default: []
    end
  end
end
