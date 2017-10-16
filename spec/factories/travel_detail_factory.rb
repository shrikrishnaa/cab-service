FactoryGirl.define do
  factory :travel_detail do
    association :cab, factory: :cab
    association :customer, factory: :customer
    origin_lat {12.9082}
    origin_long {77.6074}
    destination_lat {11.9082}
    destination_long {87.6074}
  end
end
