class GamesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]


  def index
    @games = Game.all.includes(:user)
  end
  
  def show
    @game = Game.find_by_code!(params[:code])
  end
  
  def create
    @game = Game.new(game_params)
    @game.user = current_user
    if @game.save
      render :show
    else
      render json: { errors: @game.errors }, status: :unprocessable_entity
    end
  end
  
  private

  def game_params
    params.require(:game).permit(:name)
  end
end