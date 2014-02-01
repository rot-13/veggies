FactoryGirl.define do

  factory :veggie do
    sequence :heb_name do |n|
      "ripetomato #{n}"
    end
    factory :veggie_with_prices do

      ignore do
        prices_count 3
      end

      after(:create) do |veggie, evaluator|
        create_list(:price, evaluator.prices_count, veggie: veggie)
      end
    end
  end

  factory :price do
    primary_price { rand(100..1000) }
    secondary_price { rand(100..1000) }
  end

  factory :twitter_account do
    access_token "access_token"
    access_secret "access_secret"
    veggie
    hash_tags ['ripetomato']
  end

end
