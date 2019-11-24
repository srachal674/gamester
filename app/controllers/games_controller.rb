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

  private

  def search  
    if params[:search].blank?  
      redirect_to(root_path, alert: "Empty field!") and return  
    else  
      @parameter = params[:search].downcase  
      @results = Store.all.where("lower(name) LIKE :search", search: @parameter)  
    end  
  end

  def game_params
    params.require(:game).permit(:name, :description)
  end

end
