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
    veggie_fields = sanitized_veggie(raw_veggie)
    FetchedVeggie.new(
        :date            => parsed_date(veggie_fields[0]),
        :heb_name        => veggie_fields[1],
        :primary_price   => parsed_price(veggie_fields[2]),
        :secondary_price => parsed_price(veggie_fields[3])
    )
  end

  def sanitized_veggie(raw_veggie)
    raw_veggie.css('td').map do |field|
      field.text.strip
    end
  end

  def parsed_date(date_string)
    Date.strptime(date_string , '%d/%m/%y')
  end

  def parsed_price(price_string)
    (price_string.to_f * 100).to_i
  end

  class FetchedVeggie < Hashie::Dash

    property :date
    property :heb_name
    property :primary_price
    property :secondary_price

  end

end