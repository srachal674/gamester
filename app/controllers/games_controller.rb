class GamesController < ApplicationController

  def index
    @games = Game.all
  end

  def new
    @game = Game.new

  end

  def create
    Game.create(game_params)
    redirect_to root_path
  end

  private

  def api(url)
    
    api = Apicalypse.new("https://myapi.com/foobar")
  end

  def Apicalypse
    api_endpoint = 'https://api-v3.igdb.com/games'
    request_headers = { headers: { 'c6e1ced2526e1ce816f4946d66405b3c' => 'your-igdb-api-key' } }
    
    api = Apicalypse.new(api_endpoint, request_headers)
    
    api
      .fields(:name, :total_rating)
      .where(category: 1)
      .search('Call of Duty')
      .limit(2)
      .request
    
    # api response
    
    [
      {"id"=>107299, "name"=>"Call of Duty: WWII - Shadow War", "total_rating"=>75.0},
      {"id"=>57700, "name"=>"Call of Duty: Infinite Warfare - Retribution", "total_rating"=>60.0}
    ]
  end

  def game_params
    params.require(:game).permit(:name, :description)
  end

end
