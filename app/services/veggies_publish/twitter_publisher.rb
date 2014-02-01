require 'twitter_poster'
require 'active_support/number_helper'

module VeggiesPublish

  class TwitterPublisher
    TWEET_VEGGIE_TEMPLATE = "%{name} ב-%{price}"
    MAX_TWEET_LENGTH = 140

    def initialize(twitter_app_credentials)
      @twitter_app_credentials = twitter_app_credentials
    end

    def publish(accounts=TwitterAccount.all)
      accounts.each do |account|
        user_credentials = @twitter_app_credentials.merge(access_token: account.access_token, 
                                                          access_secret: account.access_secret)
        poster = TwitterPoster.new(user_credentials)
        tweets = compose_tweets(account)
        tweets.each { |tweet| poster.post_tweet(tweet) }
      end
    end

    def compose_tweets(account)
      hash_tags = account.hash_tags.map { |ht| "\##{ht}" }
      veggies_text = account.veggies_by_general_name.map do |veggie|
        TWEET_VEGGIE_TEMPLATE % {name: veggie.heb_name, price: price_in_shekels(veggie.current_primary_price)}
      end
      tweet_length = compose_tweet(veggies_text, hash_tags).length
      if tweet_length > MAX_TWEET_LENGTH
        tweet_count = (tweet_length / MAX_TWEET_LENGTH.to_f).ceil
        slice_count = (veggies_text.count/tweet_count.to_f).ceil
        veggies_text.each_slice(slice_count).to_a.map do |vtext|
          compose_tweet(vtext, hash_tags)
        end
      else
        [compose_tweet(veggies_text, hash_tags)]
      end
    end

    def price_in_shekels(price)
      price_in_shekels = price / 100.0
      ActiveSupport::NumberHelper.number_to_currency(price_in_shekels, unit: '₪')
    end

    private

    def compose_tweet(veggies_text, hash_tags)
      "#{veggies_text.join(', ')} #{hash_tags.join(' ')}"
    end
  end
end
