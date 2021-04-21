class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_game!
  def index
    @questions = Question.all.includes(:game)
  end

  def create
    @question = @game.questions.new(question_params)
    @question.user = current_user
    if @question.save
      puts @question.inspect
      render :show
    end
  end

  private

  def find_game!
    @game = Game.find_by_code!(params[:game_code])
    puts @game.inspect
  end
  
  def question_params
    params.require(:question).permit(:round, :category, :prompt, :value, :answer)
  end
end