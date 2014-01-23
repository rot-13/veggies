module VeggiesSync

  class FetchedVeggie < Hashie::Dash

    attr_reader :prices

    property :date
    property :heb_name
    property :primary_price
    property :secondary_price

    def prices
      to_hash.symbolize_keys.slice(:primary_price, :secondary_price)
    end

  end

end