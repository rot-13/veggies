class Veggie < ActiveRecord::Base

  has_many :prices, :dependent => :destroy

end