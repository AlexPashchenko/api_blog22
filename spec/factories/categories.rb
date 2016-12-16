FactoryGirl.define do
  factory :category do
    name { Faker::Beer.alcohol}
  end
end
