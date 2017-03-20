require 'sinatra'

class PersonalDetailsApp < Sinatra::Base

	get '/' do 
		erb :tic_tac_toe
	end

get '/' do
	erb :board
end




end