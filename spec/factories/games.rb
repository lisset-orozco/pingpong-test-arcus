FactoryBot.define do
  factory :game do
    association :opponent, factory: :user
    association :player, factory: :user
    player_score { rand(9..21) }
    opponent_score { rand(9..21) }
    played_at { Time.now }
  end
end
