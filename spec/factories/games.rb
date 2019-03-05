FactoryBot.define do
  factory :game do
    association :opponent, factory: :user
    association :player, factory: :user
    player_score { 5.0 }
    opponent_score { 3.0 }
    played_at { }
  end
end
