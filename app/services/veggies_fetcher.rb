require 'open-uri'

class VeggiesFetcher

  VEGGIES_SOURCE_URL  = 'http://plants.moonsitesoftware.co.il/'
  VEGGIES_ITEMS_CSS   = '.rgMasterTable tbody tr'

  def fetch
    page = Nokogiri::HTML(open(VEGGIES_SOURCE_URL))
    raw_veggies = page.css(VEGGIES_ITEMS_CSS)
    raw_veggies.map { |raw_veggie| mapped_veggie(raw_veggie) }
  end

  private

  def mapped_veggie(raw_veggie)
    sanitized_veggie_fields = sanitized_veggie(raw_veggie)
    FetchedVeggie.new(
        :date            => Date.strptime(sanitized_veggie_fields[0] , '%d/%m/%y'),
        :heb_name        => sanitized_veggie_fields[1],
        :primary_price   => sanitized_veggie_fields[2],
        :secondary_price => sanitized_veggie_fields[3]
    )
  end

  def sanitized_veggie(raw_veggie)
    raw_veggie.css('td').map do |field|
      field.text.strip
    end
  end

  class FetchedVeggie < Hashie::Dash

    property :date
    property :heb_name
    property :primary_price
    property :secondary_price

  end

end