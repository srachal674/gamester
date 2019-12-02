class GamesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @games = Game.all
  end

  def new
    @game = Game.new

  end

  def create
    current_user.games.create(game_params)
    redirect_to root_path
  end

  def show
    @game = Game.find(game_params(:id))
  end

  # def edit
  #   @game = Game.find(game_params[:id])
  # end

  # def update
  #   @game = Game.find(game_params[:id])
  #   @game.update_attributes(game_params)
  #   redirect_to root_path
  # end

  # def destroy
  #   @game = Game.find(game_params[:id])
  #   @game.destroy
  #   redirect_to root_path
  # end

  private


  def game_params
    params.require(:game).permit(:name, :description)
  end

end
