require 'minitest/autorun'
require_relative 'board.rb'

class TestTicTacToe < Minitest::Test
	
	def test_new_board
			board = Board.new
			assert_equal(Array.new(9, ''), board.ttt_board)
	end

	def test_update_position
			board = Board.new
			board.update_position(0, 'x')
			assert_equal(['x', '', '', '', '', '', '', '', ''], board.ttt_board)
	end

	def test_1st_X_2nd_is_O
			board = Board.new
			board.update_position(0, 'x')
			board.update_position(1, 'o')
			assert_equal(['x', 'o', '', '', '', '', '', '', ''], board.ttt_board)
	end

	def test_update_partial_board_at_last_position
			board = Board.new
			board.ttt_board = ['x', 'o', '', 'o', '', '', '', '', '']
			board.update_position(8, 'x')
			assert_equal(['x', 'o', '', 'o', '', '', '', '', 'x'], board.ttt_board)
	end

	def test_position_is_available
			board = Board.new
			board.ttt_board = ['x', 'o', '', 'o', '', '', '', '', '']
			assert_equal(true, board.valad_position?(6))
			assert_equal(false, board.valad_position?(0))
			assert_equal(false, board.valad_position?(15))
	end

end