# == Schema Information
#
# Table name: records
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null
#  game_id     :integer          not null
#  points_won  :integer          default(0), not null
#  points_lost :integer          default(0), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Record < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :game, class_name: 'Game'

  # -- Validations ----------------------------------------------------------

  validates_presence_of :points_won,
                        :points_lost

  # -- Scopes ---------------------------------------------------------------
  
  scope :ranking_list, -> { group(:user_id)
                            .select("user_id, SUM(points_won - points_lost) as score")
                            .order("score DESC") }

end
