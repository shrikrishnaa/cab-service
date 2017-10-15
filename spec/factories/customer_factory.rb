FactoryGirl.define do
  factory :customer do
    name {Faker::Name.name}
    email {Faker::Internet.email}
    latitude {12.9082}
    longitude {77.6074}
  end
end
