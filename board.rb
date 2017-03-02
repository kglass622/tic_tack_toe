class  Board

	attr_accessor :ttt_board #allows them to read + WRITE #:attaches to what you initialized

	def initialize()
		@ttt_board = Array.new(9, '')#instance variable
	end

	def update_position(position, marker)
		ttt_board[position] = marker
	end

	def valid_position?(position)
		if ttt_board[position] == ''

			true

		else

			false
		end
	end

	def valid_input?(input)
		if input.match(/[XxOo]/)
			true
		else
			false
		end
	end

	def game_tie?
		if ttt_board.include?('')
			false
		else
			true
		end
	end

	def winner?(marker)
		ttt_board[0] == marker && ttt_board[1] == marker && ttt_board[2] == marker ||
		 ttt_board[3] == marker && ttt_board[4] == marker && ttt_board[5] == marker ||
		 ttt_board[6] == marker && ttt_board[7]  == marker  && ttt_board[8] == marker ||
		 ttt_board[0] == marker && ttt_board[3]  == marker  && ttt_board[6] == marker ||
		 ttt_board[1] == marker && ttt_board[4]  == marker  && ttt_board[7] == marker ||
		 ttt_board[2] == marker && ttt_board[5]  == marker  && ttt_board[8] == marker ||
		 ttt_board[0] == marker && ttt_board[4]  == marker  && ttt_board[8] == marker ||
		ttt_board[2] == marker && ttt_board[4]  == marker  && ttt_board[6] == marker
	end
end

	