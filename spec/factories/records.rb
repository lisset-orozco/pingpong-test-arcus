FactoryBot.define do
  factory :record do
    association :user, factory: :user
    association :game, factory: :game
    points_won { rand(0..5) }
    points_lost { rand(0..3) }
  end 
end
