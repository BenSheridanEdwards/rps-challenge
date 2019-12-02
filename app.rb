require 'sinatra/base'
require './lib/player.rb'
require './lib/game.rb'
require './lib/computer.rb'

class Rock_Paper_Scissors < Sinatra::Base

  get '/' do
    erb(:index)
  end

  post '/names' do
    player_1 = Player.new(params[:player_1_name])
    $game = Game.new(player_1)
    redirect '/turn'
  end

  get '/turn' do
    @game = $game
    erb(:turn)
  end

  get '/rock' do
    @game = $game
    @game.player_1.chooses("Rock")
    @game.computer.randomly_choose
    @game.decide_winner
    erb(:outcome)
  end

  get '/paper' do
    @game = $game
    @game.player_1.chooses("Paper")
    @game.computer.randomly_choose
    @game.decide_winner
    erb(:outcome)
  end

  get '/scissors' do
    @game = $game
    @game.player_1.chooses("Scissors")
    @game.computer.randomly_choose
    @game.decide_winner
    erb(:outcome)
  end

  run! if app_file == $0
end