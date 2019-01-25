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
end
