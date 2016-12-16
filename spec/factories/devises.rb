FactoryGirl.define do
  factory :devise do
    token {Faker::Bitcoin.address}
    devise_name {Faker::Company.name}
    platform_id 1
  end
end
