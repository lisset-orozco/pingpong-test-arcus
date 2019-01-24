class Game < ApplicationRecord
  belongs_to :player, class_name: 'User'
  belongs_to :opponent, class_name: 'User'

  validates :player, presence: true
  validates :opponent, presence: true
  validates :player_score, presence: true
  validates :opponent_score, presence: true
  validates :played_at, presence: true
  
  after_save :dispatch_records

  protected

  def dispatch_records
    RecordService.new(self).save
  end
  
end
