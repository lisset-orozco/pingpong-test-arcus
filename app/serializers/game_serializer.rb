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

class GameSerializer < ActiveModel::Serializer
  attributes :id, :player_id, :player_score, :opponent_id, :opponent_score, :played_at
end
