require_relative 'board.rb'
require_relative 'sequential_AI.rb'
require_relative 'random_AI.rb'

class ConsoleGame
	attr_accessor :board, :player1, :player2, :active_player

	def initialize(player1, player2)
		@player1 = player1
		@player2 = player2 
		@board = Board.new
		@active_player = player1
	end

	def intro
		puts 'Welcome to Tic Tac Toe!'
	end

	def display_board

  	puts " #{board.ttt_board[0]} | #{board.ttt_board[1]} | #{board.ttt_board[2]} "
  	puts "-----------"
  	puts " #{board.ttt_board[3]} | #{board.ttt_board[4]} | #{board.ttt_board[5]} "
  	puts "-----------"
  	puts " #{board.ttt_board[6]} | #{board.ttt_board[7]} | #{board.ttt_board[8]} "
	puts "                                                                       "
	end

	def get_move
		active_player.get_move(board.ttt_board)
	end

	def update_position
		move = get_move
		marker = active_player.marker
		board.update_position(move, marker)
	end

	def change_player
		if active_player == player1
			@active_player = player2
		else
			@active_player = player1
		end
		 active_player
	end

	def check_winner
		if board.winner?(active_player.marker)
			true
		else
			false
		end
	end

	def check_tie
		if board.game_tie?()
			puts true
		else
			puts false
		end
	end
end