require 'twitter_poster'
require 'active_support/number_helper'

module VeggiesPublish
  TWEET_PREFIX = 'מחירון:'
  TWEET_VEGGIE_TEMPLATE = "%{name} ב-%{price}"

  class TwitterPublisher
    def initialize(twitter_app_credentials)
      @twitter_app_credentials = twitter_app_credentials
    end

    def publish(accounts=TwitterAccount.all)
      accounts.each do |account|
        tweet = compose_tweet(account)
        user_credentials = @twitter_app_credentials.merge(access_token: account.access_token, 
                                                          access_secret: account.access_secret)
        poster = TwitterPoster.new(user_credentials)
        poster.post_tweet(tweet)
      end
    end

    def compose_tweet(account)
      veggies_text = account.veggies_by_general_name.map do |veggie|
        price_in_shekels = veggie.current_primary_price / 100.0
        price_in_shekels_str = ActiveSupport::NumberHelper.number_to_currency(price_in_shekels, unit: '₪')
        TWEET_VEGGIE_TEMPLATE % {name: veggie.heb_name, price: price_in_shekels_str}
      end
      hash_tags = account.hash_tags.map { |ht| "\##{ht}" }
      "#{TWEET_PREFIX} #{veggies_text.join(', ')} #{hash_tags.join(' ')}"
    end
  end
end
