class GamesController < ApplicationController
  before_action :find_game, only: :show

  def index
    @games = Game.all

    render json: @games, each_serializer: GameShowSerializer
  end

  def create
    @game = Game.new(game_params)

    if @game.save  
      render json: GameSerializer.new(@game), status: :created
    else
      render json: @game.errors.as_json, status: :unprocessable_entity
    end
  end

  def show
    render json: @game
  end

  private

  def game_params
    params.require(:game).permit(:player_id, :opponent_id, :player_score, :opponent_score, :played_at)
  end

  def find_game 
    @game = Game.find_by_id(params[:id])
  end
end
