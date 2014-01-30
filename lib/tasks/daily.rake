namespace :daily do

  desc 'sync the veggies and their daily prices into the database'
  task :sync_veggies => :environment do
    next puts "SHABES! Skipping the job" if jewish_weekend?

    puts 'Started syncing daily veggies.'
    VeggiesSync::Syncer.new.sync
    puts 'Ended syncing daily veggies.'
  end

  desc 'publishes the veggies to twitter'
  task :twitter_publish => :environment do
    next puts "SHABES! Skipping the job" if jewish_weekend?

    puts 'Started publishing veggies to twitter'
    publisher = VeggiesPublish::TwitterPublisher.new(consumer_key: ENV['TWITTER_CONSUMER_KEY'], consumer_secret: ENV['TWITTER_CONSUMER_SECRET'])
    publisher.publish()
    puts 'Ended publishing veggies to twitter'
  end


  def jewish_weekend?(date=Time.now)
    #Time.now.end_of_week will return sunday, so friday is -1 & saturday is -2
    end_of_week = date.end_of_week
    friday = end_of_week - 2.day
    saturday = end_of_week - 1.day
    (date.day == friday.day) || (date.day == saturday.day)
  end
end
