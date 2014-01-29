class Veggie < ActiveRecord::Base

  scope :by_weights, order(:weight)

  has_many :prices, :dependent => :destroy

end