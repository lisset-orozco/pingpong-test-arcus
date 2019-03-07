class RecordService
  def initialize(game)
    @game = game
  end

  def create_object
    is_valid(Record.create(user: player_won, game: @game, points_won: 5)) && 
    is_valid(Record.create(user: player_loser, game: @game, points_lost: 3))
  end

  private 

  def player_won
    return @game.player if @game.player_score > @game.opponent_score
    @game.opponent
  end

  def player_loser
    return @game.player if @game.player_score < @game.opponent_score
    @game.opponent
  end

  def is_valid(object)
    return false unless object.valid?
    true
  end
end
