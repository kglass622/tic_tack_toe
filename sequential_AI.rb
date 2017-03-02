class Sequential_AI

	attr_reader :marker

	def initialize(marker)
		@marker = marker
	end

	def get_move(empty_board)
		empty_board.index('')
	end

end