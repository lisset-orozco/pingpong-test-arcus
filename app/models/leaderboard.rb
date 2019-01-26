class Leaderboard < ActiveModelSerializers::Model
  include ActiveModel::Validations

  attr_accessor :id, :rank, :first_name, :last_name, :email # id=user_id

  validates :id, :rank, :first_name, :last_name, :email, presence: true

end
