require 'faker'
FactoryGirl.define do
  factory :post do |f|
    user_id 1
    category_id 1
    f.text { Faker::Lorem.sentence }
  end
end
