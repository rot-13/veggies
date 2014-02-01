require 'spec_helper'

describe VeggiesPublish::TwitterPublisher do

  subject do
    VeggiesPublish::TwitterPublisher.new({})
  end

  let(:account) do
    create(:twitter_account, :veggie => create(:veggie_with_prices))
  end

  let(:account_multi_veggies) do
    6.times { create(:veggie_with_prices) }
    create(:twitter_account, :veggie => create(:veggie_with_prices))
  end

  describe :compose_tweets do
    it 'should be able to return one valid tweet' do
      price_in_shekels = subject.price_in_shekels(account.veggie.current_primary_price)
      result = subject.compose_tweets(account)
      result.length.should == 1
      result.first.should include(account.veggie.heb_name, price_in_shekels, account.hash_tags.join(' '))
      result.first.length.should <= VeggiesPublish::TwitterPublisher::MAX_TWEET_LENGTH
    end

    it 'should be able to return two valid tweets' do
      result = subject.compose_tweets(account_multi_veggies)
      result.length.should == 2
      result.each { |tweet| tweet.length.should <= VeggiesPublish::TwitterPublisher::MAX_TWEET_LENGTH }
    end
  end
end
