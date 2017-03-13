class Unbeatable

	attr_accessor :marker

	def initialize(marker)
		@marker = marker
	end

	def get_move(ttt_board)
		if get_win(ttt_board) < 9
			p 'win'
			move = get_win(ttt_board)
		elsif
			get_block(ttt_board) < 9
			p 'block'
			move = get_block(ttt_board)
		elsif 
			win_check_fork(ttt_board) < 9
			p 'fork'
			move = win_check_fork(ttt_board)
		elsif 
			block_check_fork(ttt_board) < 9
			p 'block fork'
			move = block_check_fork(ttt_board)
		elsif 
			take_center(ttt_board) < 9
			p 'center'
			move = take_center(ttt_board)
		elsif 
			take_corner(ttt_board) < 9
			p 'corner'
			move = take_corner(ttt_board)
		elsif 
			take_empty_corner(ttt_board) < 9
			p 'empty corner'
			move = take_empty_corner(ttt_board)
		elsif 
			take_empty_side(ttt_board) < 9
			p 'side'
			move = take_empty_side(ttt_board)
		else	
			p 'over'
			move = ttt_board.index('')
		end
	end

	def get_win(ttt_board)
		win_array = [
			[0, 1, 2], 
			[3, 4, 5], 
			[6, 7, 8], 
			[0, 3, 6], 
			[1, 4, 7], 
			[2, 5, 8], 
			[0, 4, 8], 
			[2, 4, 6]
			]
		# win_array.each do |win|
			board_position = [
			[ttt_board[0], ttt_board[1], ttt_board[2]], 
			[ttt_board[3], ttt_board[4], ttt_board[5]], 
			[ttt_board[6], ttt_board[7], ttt_board[8]], 
			[ttt_board[0], ttt_board[3], ttt_board[6]], 
			[ttt_board[1], ttt_board[4], ttt_board[7]], 
			[ttt_board[2], ttt_board[5], ttt_board[8]], 
			[ttt_board[0], ttt_board[4], ttt_board[8]],
			[ttt_board[2], ttt_board[4], ttt_board[6]]
					]
				marker1 = 'X'
				marker2 = 'O'
					if marker == marker1
						opponent = marker2
					else 
						opponent = marker1
					end
			results = 9

			board_position.each_with_index do |win_line, index|
				# p win_line

				if win_line.count(marker) == 2 && win_line.count('') == 1
					winning_pos = win_line.index('')
					results = win_array[index][winning_pos]
				else 
					results
				end
		end
		results
	end

	def get_block(ttt_board)
		win_array = [
			[0, 1, 2], 
			[3, 4, 5], 
			[6, 7, 8], 
			[0, 3, 6], 
			[1, 4, 7], 
			[2, 5, 8], 
			[0, 4, 8], 
			[2, 4, 6]
			]
		# win_array.each do |win|

			board_position = [
			[ttt_board[0], ttt_board[1], ttt_board[2]], 
			[ttt_board[3], ttt_board[4], ttt_board[5]], 
			[ttt_board[6], ttt_board[7], ttt_board[8]], 
			[ttt_board[0], ttt_board[3], ttt_board[6]], 
			[ttt_board[1], ttt_board[4], ttt_board[7]], 
			[ttt_board[2], ttt_board[5], ttt_board[8]], 
			[ttt_board[0], ttt_board[4], ttt_board[8]],
			[ttt_board[2], ttt_board[4], ttt_board[6]]
					]
				marker1 = 'X'
				marker2 = 'O'

					if marker == marker1
						opponent = marker2
					else 
						opponent = marker1
					end
				
			results = 9
			board_position.each_with_index do |win_line, index|

				if win_line.count(opponent) == 2 && win_line.count('') == 1
					winning_pos = win_line.index('')
						results = win_array[index][winning_pos]
				else 
					results
				end
			end
				results
	end

	def win_check_fork(ttt_board)

		fork_combinations = [
			[ttt_board[0], ttt_board[1], ttt_board[2]], 
			[ttt_board[3], ttt_board[4], ttt_board[5]], 
			[ttt_board[6], ttt_board[7], ttt_board[8]], 
			[ttt_board[0], ttt_board[3], ttt_board[6]], 
			[ttt_board[1], ttt_board[4], ttt_board[7]], 
			[ttt_board[2], ttt_board[5], ttt_board[8]], 
			[ttt_board[0], ttt_board[4], ttt_board[8]],
			[ttt_board[2], ttt_board[4], ttt_board[6]]
					]
		fork_positions = [
			[0, 1, 2], 
			[3, 4, 5], 
			[6, 7, 8], 
			[0, 3, 6], 
			[1, 4, 7], 
			[2, 5, 8], 
			[0, 4, 8], 
			[2, 4, 6]
			]	

		fork_line = []
		fork_spot = []
		i = []

		fork_combinations.each_with_index do |forking_line, index|

			if forking_line.count(marker) == 1 && forking_line.count('') == 2
				fork_line = forking_line
				i.push(index)
			end
		end

		i.each do |index|
			fork_spot << fork_positions[index]
		end

		fork_spot = fork_spot.flatten.sort

		intersections = []

		fork_spot.each do |spot|

			if ttt_board[spot] == ''
				intersections.push(spot)
			end
		end

		if intersections.detect { |match| intersections.count(match) > 1 } == nil
				move = 9

			else

				move = intersections.detect { |match| intersections.count(match) > 1 }

		end

	move
	end

	def block_check_fork(ttt_board)

		opponent = 'X'

		if marker == 'X'
			opponent = 'O'

		else 
			opponent = 'X'
		end

		fork_combinations = [
			[ttt_board[0], ttt_board[1], ttt_board[2]], 
			[ttt_board[3], ttt_board[4], ttt_board[5]], 
			[ttt_board[6], ttt_board[7], ttt_board[8]], 
			[ttt_board[0], ttt_board[3], ttt_board[6]], 
			[ttt_board[1], ttt_board[4], ttt_board[7]], 
			[ttt_board[2], ttt_board[5], ttt_board[8]], 
			[ttt_board[0], ttt_board[4], ttt_board[8]],
			[ttt_board[2], ttt_board[4], ttt_board[6]]
			]

		fork_positions = [
			[0, 1, 2], 
			[3, 4, 5], 
			[6, 7, 8], 
			[0, 3, 6], 
			[1, 4, 7], 
			[2, 5, 8], 
			[0, 4, 8], 
			[2, 4, 6]
			]	

		# fork_line = []
		fork_spot = []
		i = []
		fork_combinations.each_with_index do |forking_line, index|

			if forking_line.count(opponent) == 1 && forking_line.count('') == 2
				# fork_line = forking_line
				i.push(index)
			end
		end

		i.each do |index|
			fork_spot << fork_positions[index]
		end

		fork_spot = fork_spot.flatten.sort

		intersections = []

		fork_spot.each do |spot|

			if ttt_board[spot] == ''
				intersections.push(spot)
			end
		end

		if ttt_board == ['', '', opponent, '', marker, '', opponent, '', '']
			move = 3

		elsif ttt_board == [opponent, '', '', '', marker, '', '', '', opponent]

			move = 3

		elsif intersections.detect { |match| intersections.count(match) > 1 } == nil

				move = 9

			else

				move = intersections.detect { |match| intersections.count(match) > 1 }

		end

	end

	def take_center(ttt_board)
		if ttt_board[4] == ''
			move = 4
		else
			move = 9
		end

	end



	def take_corner(ttt_board)

			opponent = 'X'

		if marker == 'X'
			opponent = 'O'

		else 
			opponent = 'X'
		end

		if ttt_board[0] == opponent && ttt_board[8] == ''

			move = 8

		elsif 

			ttt_board[6] == opponent && ttt_board[2] == ''
			move = 2

		elsif 

			ttt_board[8] == opponent && ttt_board[0] == ''
			move = 0

		elsif 

			ttt_board[2] == opponent && ttt_board[6] == ''
			move = 2
		else 
			move = 10
		end

	end

	def take_empty_corner(ttt_board)
		empty_corner = []
		corners = [0, 2, 6, 8]

		corners.each do |empty|
			if ttt_board[empty] == ''
			empty_corner << empty
			end
		end

		if empty_corner.length > 0
			move = empty_corner.shift
		else
			move = 10
		end
		
	end

	def take_empty_side(ttt_board)
		empty_side = []
		sides = [1, 3, 5, 7]

		sides.each do |em|
			if ttt_board[em] == ''
			empty_side << em
			end
		end

		if empty_side.length > 0
			move = empty_side.shift
		else
			move = 10
		end
	end

end

