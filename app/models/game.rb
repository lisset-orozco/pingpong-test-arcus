class Game < ApplicationRecord
  belongs_to :player, class_name: 'User'
  belongs_to :opponent, class_name: 'User'

  validates_presence_of :player,
                        :opponent,
                        :player_score,
                        :opponent_score,
                        :played_at

  scope :desc_order, -> { order(played_at: :desc) }
end
