FactoryGirl.define do
  factory :cab do
    name {Faker::Vehicle.manufacture}
    model {"innova"}
    color {Faker::Color.color_name}
    available_status {"available"}
    number {"KA 01 JV 1234"}
    latitude {12.9082}
    longitude {77.6074}
  end
end
