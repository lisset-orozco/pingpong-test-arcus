class GameService
  def initialize(params)
    @game = Game.new(params)
  end

  def create_object
    return true if @game.save && RecordService.new(@game).create_object
    false
  end

  def object
    @game
  end
end
