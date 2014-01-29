class TwitterAccount < ActiveRecord::Base

  belongs_to :veggie

  def veggies_by_general_name
    #In here i'm assuming that the first word of the raw veggie name is the general veggie.
    estimated_veggie_name = veggie.heb_name.split(' ').first
    Veggie.where('heb_name LIKE ?', "%#{estimated_veggie_name}%").to_a
  end

end

