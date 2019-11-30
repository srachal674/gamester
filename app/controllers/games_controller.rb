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
    @game = Game.find(params(:search))
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    @game.update_attributes(game_params)
    redirect_to root_path
  end

  private

  def search  
    if params[:search].blank?  
      redirect_to(root_path, alert: "Empty field!") and return  
    else  
      @game = params[:search].downcase  
      @results = Store.all.where("lower(name) LIKE :search", search: @game)  
    end  
  end

  def game_params
    params.require(:game).permit(:name, :description)
  end

end
