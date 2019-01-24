class Record < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :game, class_name: 'Game'
end
