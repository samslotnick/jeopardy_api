class ContestantsController < ApplicationController
  before_action :find_game!

  def index
    # @games = Game.all.includes(:user)
    @contestants = @game.contestants
  end
  
  def create
    @contestant = @game.contestants.new(contestant_params)
    if @contestant.save
      render :index
    else
    render json: { errors: @contestant.errors }, status: :unprocessable_entity
    end
  end
  
  private
  
  def find_game!
    @game = Game.find_by_code!(params[:game_code])
  end

  def contestant_params
    params.require(:contestant).permit(:name)
  end
end