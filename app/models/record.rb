class Record < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :game, class_name: 'Game'

  scope :ranking_list, -> { group(:user_id)
                            .select("user_id, SUM(points_won - points_lost) as points")
                            .order("points DESC") }
end
