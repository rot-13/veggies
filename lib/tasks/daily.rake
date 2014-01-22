namespace :daily do

  desc 'sync the veggies and their daily prices into the database'
  task :sync_veggies => :environment do
    puts 'Started syncing daily veggies.'
    VeggiesSync::Syncer.new.sync
    puts 'Ended syncing daily veggies.'
  end
end