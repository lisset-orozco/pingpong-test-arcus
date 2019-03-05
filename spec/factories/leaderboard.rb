
FactoryBot.define do
  factory :leaderboard do
    id { 1 } 
    rank { 2 } 
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    sequence(:email){|n| "liss_#{n}@factoryb.bcom"} # email { Faker::Internet.email }
  end
end
