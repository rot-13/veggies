module VeggiesSync

  class DatabaseUpdater

    def update_from(fetched_veggies)
      fetched_veggies.each do |fetched_veggie|
        veggie = find_or_create_veggie(fetched_veggie)
      end
    end

    private

    def find_or_create_veggie(fetched_veggie)
      Veggie.where(:heb_name => fetched_veggie.heb_name).first_or_create
    end

  end

end