require 'minitest/autorun'
require_relative 'board.rb'

class TestTicTacToe < Minitest::Test

	def test_new_board
		board = Board.new
		assert_equal(Array.new(9, ''), board.ttt_board)
	end

	def test_update_first_position_x_or_o
		board = Board.new
		board.update_position(0, 'X')
		assert_equal(['X','','','','','','','',''], board.ttt_board)
	end

	def test_first_position_x_second_position_o
		board = Board.new
		board.update_position(0, 'X')
		board.update_position(1, 'O')
		assert_equal(['X','O','','','','','','',''], board.ttt_board)
	end

	def test_update_partial_board_at_last_position
		board = Board.new
		board.ttt_board = ['X','O','','O','','','','','']
		board.update_position(8, 'X')
		assert_equal(['X','O','','O','','','','','X'], board.ttt_board)
	end

	def test_check_if_position_is_avaliable
		board = Board.new
		board.ttt_board = ['X','O','','O','','','','','']
		assert_equal(true, board.valid_position?(6)) # ? lets you know its a boolean
		assert_equal(false, board.valid_position?(0))
		assert_equal(false, board.valid_position?(15))
		assert_equal(true, board.valid_position?(8))
	end

	def test_for_a_full_board
		board = Board.new
		board.ttt_board = ['X','O','X','O','X','O','X','O','']
		assert_equal(false, board.game_tie?)
	end

	def test_for_a_full_board_2
		board = Board.new
		board.ttt_board = ['X','O','X','O','X','O','X','O','X']
		assert_equal(true, board.game_tie?)
	end

	def test_valid_input_of_x_and_o
		board = Board.new
		assert_equal(false, board.valid_input?('m'))
		assert_equal(true, board.valid_input?('O'))
		assert_equal(true, board.valid_input?('X'))
		assert_equal(false, board.valid_input?(''))
		assert_equal(false, board.valid_input?('@'))
	end

	def test_for_win_at_positions_0_1_2_with_x
		board = Board.new
		marker = 'X'
		board.ttt_board = ['X','X','X','','','','','','']
		assert_equal(true, board.winner?(marker))
	end

	def test_for_false_winning_position_1_2_3
		board = Board.new
		marker = 'X'
		board.ttt_board = ['','X','O','O','','','','','']
		assert_equal(false, board.winner?(marker))
	end

	def test_for_win_at_position_3_4_5_with_O
		board = Board.new
		marker = 'O'
		board.ttt_board = ['','','','X','O','X','','','']
		assert_equal(false, board.winner?(marker))
	end

	def test_for_win_at_position_3_4_5_with_O_true
		board = Board.new
		marker = 'O'
		board.ttt_board = ['','','','O','O','O','','','']
		assert_equal(true, board.winner?(marker))
	end

	def test_for_win_at_position_6_7_8_true
		board = Board.new
		marker = 'X'
		board.ttt_board = ['','','','','','','X','X','X']
		assert_equal(true, board.winner?(marker))
	end

	def test_for_win_at_0_3_6_true
		board = Board.new
		marker = 'X'
		board.ttt_board = ['X','','','X','','','X','','']
		assert_equal(true, board.winner?(marker))
	end

	def test_for_win_at_1_4_7_true
		board = Board.new
		marker = 'X'
		board.ttt_board = ['','X','','','X','','','X','']
		assert_equal(true, board.winner?(marker))
	end

	def test_for_win_at_2_5_8
		board = Board.new
		marker = 'X'
		board.ttt_board = ['','','X','','','X','','','X']
		assert_equal(true, board.winner?(marker))
	end

	def test_for_win_at_0_4_8
		board = Board.new
		marker = 'O'
		board.ttt_board = ['O','','','','O','','','','O']
		assert_equal(true, board.winner?(marker))
	end

	def test_for_win_at_2_4_6
		board = Board.new
		marker = 'O'
		board.ttt_board = ['','','O','','O','','O','','']
		assert_equal(true, board.winner?(marker))
	end

	def test_for_false_at_2_4_6
		board = Board.new
		marker = 'X'
		board.ttt_board = ['','','X','X','','','X','','']
		assert_equal(false, board.winner?(marker))
	end

end