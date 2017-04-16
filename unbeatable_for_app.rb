class Unbeatable_App
require_relative 'tic_tac_board.rb'

	attr_reader :marker

	def initialize(marker)
		@marker = marker
	end


	def fill_move(ttt_board)

		if win(ttt_board) < 10
			move = win(ttt_board)

		elsif 
			block(ttt_board) < 10
			move = block(ttt_board)

		elsif 
			check_fork(ttt_board) < 10
			move = check_fork(ttt_board)

		elsif 
			block_fork(ttt_board) < 10
			move = block_fork(ttt_board)

		elsif 
			center(ttt_board) < 10
			move = center(ttt_board)

		elsif 
			opposite_corner(ttt_board) < 10
			move = opposite_corner(ttt_board)

		elsif 
			empty_corner(ttt_board) < 10
			move = empty_corner(ttt_board)

		else empty_side(ttt_board) < 10
			move = empty_side(ttt_board)
		end
		move
	end


	def win(ttt_board)
		win_array = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]] 

			board_pos = [
				[ttt_board[0], ttt_board[1], ttt_board[2]],
				[ttt_board[3], ttt_board[4], ttt_board[5]],
				[ttt_board[6], ttt_board[7], ttt_board[8]],
				[ttt_board[0], ttt_board[3], ttt_board[6]],
				[ttt_board[1], ttt_board[4], ttt_board[7]],
				[ttt_board[2], ttt_board[5], ttt_board[8]],
				[ttt_board[0], ttt_board[4], ttt_board[8]],
				[ttt_board[2], ttt_board[4], ttt_board[6]]
						]
	
			results = 10
			board_pos.each_with_index do |win_combo, index|

				if win_combo.count(marker) == 2 && win_combo.count { |x| x.is_a?(Integer) } == 1
					winning_index = win_combo.index { |x| x.is_a?(Integer) }
					results = win_array[index][winning_index]
				else
					results
				end
			end
			results
	end


	def block(ttt_board)
		win_array = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]] 

			board_pos = [
				[ttt_board[0], ttt_board[1], ttt_board[2]],
				[ttt_board[3], ttt_board[4], ttt_board[5]],
				[ttt_board[6], ttt_board[7], ttt_board[8]],
				[ttt_board[0], ttt_board[3], ttt_board[6]],
				[ttt_board[1], ttt_board[4], ttt_board[7]],
				[ttt_board[2], ttt_board[5], ttt_board[8]],
				[ttt_board[0], ttt_board[4], ttt_board[8]],
				[ttt_board[2], ttt_board[4], ttt_board[6]]
						]

			opponent = 'X'

			if marker == 'X'
				opponent = 'O'
			else
				opponent = 'X'
			end

			results = 10
			board_pos.each_with_index do |win_combo, index|

				if win_combo.count(opponent) == 2 && win_combo.count { |x| x.is_a?(Integer) } == 1
					winning_index = win_combo.index { |x| x.is_a?(Integer) }
					results = win_array[index][winning_index]
				else
					results
				end
			end
			results
	end


	def check_fork(ttt_board)
	
		fork_array = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]] 

			fork_pos = [
				[ttt_board[0], ttt_board[1], ttt_board[2]], 
				[ttt_board[3], ttt_board[4], ttt_board[5]],
				[ttt_board[6], ttt_board[7], ttt_board[8]], 
				[ttt_board[0], ttt_board[3], ttt_board[6]],
				[ttt_board[1], ttt_board[4], ttt_board[7]],
				[ttt_board[2], ttt_board[5], ttt_board[8]], 
				[ttt_board[0], ttt_board[4], ttt_board[8]],
				[ttt_board[2], ttt_board[4], ttt_board[6]]
						]
		
			ind = []
			fork_pos.each_with_index do |fork_combo, fork_index|
				if fork_combo.count(marker) == 1 && fork_combo.count { |x| x.is_a?(Integer) } == 2
					ind << fork_index #ind now contains the index of all rows (from fork_pos) that have 1 spot filled
				end
			end

			fork_square = []
			ind.each do |index| #this is each index number of a row with 1 spot filled
				fork_square << fork_array[index] #fork_square now contains combos in fork_array
			end

			result_array = []
			fork_square = fork_square.flatten.sort #flatten turns multidimensional array into 1 array; sort puts in order (board positions that are in array)
			fork_square.each do |square|
				if ttt_board[square].is_a?(Integer)
					result_array << square #result_array contains all positions that work and are empty
				end
			end

			if result_array.find { |combo| result_array.count(combo) > 1 } == nil #checks if a match is found
				results = 10
			else
				results = result_array.find { |combo| result_array.count(combo) > 1 } #if match is found it takes the move
			end
			results
	end


	def block_fork(ttt_board)

		fork_array = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]] 

			fork_pos = [
				[ttt_board[0], ttt_board[1], ttt_board[2]], 
				[ttt_board[3], ttt_board[4], ttt_board[5]],
				[ttt_board[6], ttt_board[7], ttt_board[8]], 
				[ttt_board[0], ttt_board[3], ttt_board[6]],
				[ttt_board[1], ttt_board[4], ttt_board[7]],
				[ttt_board[2], ttt_board[5], ttt_board[8]], 
				[ttt_board[0], ttt_board[4], ttt_board[8]],
				[ttt_board[2], ttt_board[4], ttt_board[6]]
						]

			opponent = 'X'

			if marker == 'X'
				opponent = 'O'
			else
				opponent = 'X'
			end
		
			ind = []
			fork_pos.each_with_index do |fork_combo, fork_index|
				if fork_combo.count(opponent) == 1 && fork_combo.count { |x| x.is_a?(Integer) } == 2
					ind << fork_index #ind now contains the index of all rows (from fork_pos) that have 1 spot filled
				end
			end

			fork_square = []
			ind.each do |index| #this is each index number of a row with 1 spot filled
				fork_square << fork_array[index] #fork_square now contains combos in fork_array
			end

			result_array = []
			fork_square = fork_square.flatten.sort #flatten turns multidimensional array into 1 array; sort puts in order (board positions that are in array)
			fork_square.each do |square|
				if ttt_board[square].is_a?(Integer)
					result_array << square #result_array contains all positions that work and are empty
				end
			end

			if ttt_board == [1, 2, opponent, 4, marker, 6, opponent, 8, 9]
				results = 3
			elsif ttt_board == [opponent, 2, 3, 4, marker, 6, 7, 8, opponent]
				results = 3
			elsif result_array.find { |combo| result_array.count(combo) > 1 } == nil #checks if a match is found
				results = 10
			else
				results = result_array.find { |combo| result_array.count(combo) > 1 } #if match is found it takes the move
			end
			results
	end


	def center(ttt_board)

		if ttt_board[4] == 5
			results = 4
		else
			results = 10
		end
		results
	end


	def opposite_corner(ttt_board)

		opponent = 'X'

			if marker == 'X'
				opponent = 'O'
			else
				opponent = 'X'
			end

				if ttt_board[0] == opponent && ttt_board[8].is_a?(Integer)
					results = 8
				elsif ttt_board[2] == opponent && ttt_board[6].is_a?(Integer)
					results = 6
				elsif ttt_board[6] == opponent && ttt_board[2].is_a?(Integer)
					results = 2
				elsif ttt_board[8] == opponent && ttt_board[0].is_a?(Integer)
					results = 0
				else
					results = 10
				end
				results
	end


	def empty_corner(ttt_board)

		if ttt_board[0] == 1
			results = 0
		elsif ttt_board[2] == 3
			results = 2
		elsif ttt_board[6] == 7
			results = 6
		elsif ttt_board[8] == 9
			results = 8
		else 
			results = 10
		end
		results
	end


		def empty_side(ttt_board)

		if ttt_board[1] == 2
			results = 1
		elsif ttt_board[3] == 4
			results = 3
		elsif ttt_board[5] == 6
			results = 5
		elsif ttt_board[7] == 8
			results = 7
		else 
			results = 10
		end
		results
	end
			









end