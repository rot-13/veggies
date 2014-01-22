module VeggiesSync

  class Syncer

    def sync
      fetched_veggies = Fetcher.new.fetch
      DatabaseUpdater.new(fetched_veggies).update
    end

  end

end