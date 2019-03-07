class GamesController < ApplicationController
  before_action :find_game, only: :show

  def index
    render json: Game.desc_order, each_serializer: GameShowSerializer
  end

  def create
    game_service = GameService.new(game_params)

    if game_service.create_object  
      render json: GameSerializer.new(game_service.object), status: :created
    else
      render json: game_service.errors.as_json, status: :unprocessable_entity
    end
  end

  def show
    return render json: @game if @game
    render json: { message: "Game doesn't exist" }, status: :not_found
  end

  def leaderboard
    # GameService.send_ranking_list
    render json: GameService.ranking_list, each_serializer: LeaderboardSerializer
  end

  private

  def game_params
    params.require(:game).permit(
      :player_id, 
      :opponent_id, 
      :player_score, 
      :opponent_score, 
      :played_at
    )
  end

  def find_game 
    @game = Game.find_by_id(params[:id])
  end
end
