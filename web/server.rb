require_relative '../environments.rb'
require 'sinatra/base'
require 'pry-byebug'

class RPS::Server < Sinatra::Application
	configure do
		set :bind, '0,0,0,0'
		enable :sessions
	end
	
	get '/' do
		if session[:user_id]
      redirect to('/player')
    else
      redirect to('/login')
    end
  end

  get '/login' do
    erb :login
  end

  get '/signup' do
      erb :signup
  end

  post '/player' do
  	binding.pry
  	if params[:password] == params[:password_confirmation]
  		hashed_password = RPS::Player.encrypt_password(params[:password])
      RPS::Player.create(name: params[:name], username: params[:username], password_hash: hashed_password)
    end

    redirect to('/')
  end

  post '/sessions' do
    @player = RPS::Player.find_by(username: params[:username])
    if @player.validate_password(params[:password])
      session[:user_id] = @player.id
    	redirect to ('/player')
    else
    	redirect to('/')
    end
  end

  delete '/logout' do
    session[:user_id] = nil
    redirect to('/')
  end

	# new tournament form
	get '/tournaments' do
		@tournaments = RPS::Tournament.all
		erb :tournament
	end

	# create a tournamnet
	post '/tournaments' do
  	RPS::Tournament.create(name: params["tournament_name"])
  	redirect to('/tournament/setup')
	end

	get '/tournament/setup' do
  	@players = RPS::Player.all
  	erb :tournament_setup
	end

	post '/tournament/setup' do
  	RPS::Player.create(name: params["player_name"])
  	redirect to('/tournament/setup')
	end

	get '/tournament/search' do
		tournament = RPS::Tournament.find_by(name: params["search_name"])

		redirect to("/tournament/#{tournament.id}")
	end

	get '/tournament/:id' do
		tournament = RPS::Tournament.find(params[:id])
		@players = tournament.players
		erb :tournament_id
	end
	

	get '/player' do
  	@player = RPS::Player.all
  	erb :player
	end

	# post '/player' do
 #  	RPS::Player.create(name: params["player_name"])
 #  	redirect to('/player')
	# end
end
