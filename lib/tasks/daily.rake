namespace :daily do

  desc 'sync the veggies and their daily prices into the database'
  task :sync_veggies => :environment do
    puts 'Started syncing daily veggies.'
    VeggiesSync::Syncer.new.sync
    puts 'Ended syncing daily veggies.'
  end

  desc 'publishes the veggies to twitter'
  task :twitter_publish => :environment do
    puts 'Started publishing veggies to twitter'
    publisher = VeggiesPublish::TwitterPublisher.new(consumer_key: ENV['TWITTER_CONSUMER_KEY'], consumer_secret: ENV['TWITTER_CONSUMER_SECRET'])
    publisher.publish()
    puts 'Ended publishing veggies to twitter'
  end
end
