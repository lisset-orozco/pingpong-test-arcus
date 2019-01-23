class Game < ApplicationRecord
  belongs_to :player, class_name: 'User'
  belongs_to :opponent, class_name: 'User'

end
