require 'faker'
require 'factory_girl'
FactoryGirl.define do

  factory :user do |f|
    f.name {Faker::Name.name  }
    f.email{Faker::Internet.email }
    f.login {Faker::Name.name}
    f.age { Faker::Number.between(1, 100)}
    f.password{123456 }

  end
end