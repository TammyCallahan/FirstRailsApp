FactoryBot.define do
  factory :comment do
    body "I love green!!"
    product_id 1
    user_id 1
    rating 3
  end
end
