class Veggie < ActiveRecord::Base

  scope :by_weights, -> { order('heb_name ASC').order('weight ASC') }

  has_many :prices, :dependent => :destroy
  has_one :twitter_account

  def current_primary_price
    prices.order('created_at DESC').first.primary_price
  end

end
