FactoryGirl.define do
  factory :platform do
    user_id 1
    platform_name ["ios", "android"].sample
  end
end
