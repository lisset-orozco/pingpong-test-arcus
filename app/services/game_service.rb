class GameService
  def initialize(params)
    @game = Game.new(params)
  end

  def create_object
    @game.transaction do
      return true if @game.save && RecordService.new(@game).create_object
    end
    false
  end

  def object
    @game
  end

  def self.ranking
    ranking_list = Record.ranking_list
    leaderboard = []

    ranking_list.each_with_index do |rank, i|
      leaderboard.push(
          Leaderboard.new(
            id: rank.user_id,
            rank: i + 1,
            first_name: rank.user.first_name,
            last_name: rank.user.last_name,
            email: rank.user.email
          )
      )
    end
    leaderboard
  end
end
