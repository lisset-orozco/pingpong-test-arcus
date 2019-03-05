# == Schema Information
#
# Table name: games
#
#  id             :integer          not null, primary key
#  player_id      :integer          not null
#  opponent_id    :integer          not null
#  player_score   :float            not null
#  opponent_score :float            not null
#  played_at      :datetime         not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

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
