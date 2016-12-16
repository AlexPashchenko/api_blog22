require 'faker'
FactoryGirl.define do
  factory :comment do |f|
    f.text{ Faker::Lorem.sentence}
    user_id 1
    post_id 1
  end
end
