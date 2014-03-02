require 'twitter'

class TwitterPoster
  def initialize(options)
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = options[:consumer_key]
      config.consumer_secret     = options[:consumer_secret]
      config.access_token        = options[:access_token]
      config.access_token_secret = options[:access_secret]
    end
  end

  def post_tweet(text)
    begin
      @client.update(text)
    rescue Twitter::Error => e
      puts "twitter error: #{e.to_s}. tried to tweet text: #{text}"
    end
  end
end
