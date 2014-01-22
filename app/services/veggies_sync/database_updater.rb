module VeggiesSync

  class DatabaseUpdater

    def initialize(fetched_veggies)
      @fetched_veggies = fetched_veggies
    end

    def update
      ActiveRecord::Base.transaction do
        @fetched_veggies.each do |fetched_veggie|
          persisted_veggie = find_or_create_veggie(fetched_veggie)
          add_price_to_veggie(persisted_veggie, fetched_veggie)
        end
      end
    end

    private

    def find_or_create_veggie(fetched_veggie)
      Veggie.where(:heb_name => fetched_veggie.heb_name).first_or_create
    end

    def add_price_to_veggie(persisted_veggie, fetched_veggie)
      last_price = persisted_veggie.prices.last
      persisted_veggie.prices.create(fetched_veggie.prices) if at_different_date?(last_price, fetched_veggie)
    end

    def at_different_date?(persisted_price, fetched_veggie)
      return true if persisted_price.nil?
      persisted_price.created_at.to_date != fetched_veggie.date
    end

  end

end