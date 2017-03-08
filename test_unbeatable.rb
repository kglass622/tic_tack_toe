require 'minitest/autorun'
require_relative 'unbeatable.rb'

class TestUnbeatable < Minitest::Test



	def test_create_player
		player = Unbeatable.new('X')
		assert_equal('X', player.marker)
	end


	def test_win_at_2nd_pos_with_x
		player = Unbeatable.new('X')
		board_array = ['X','X','','','','','','','']
		assert_equal(2, player.get_move(board_array))
	end

	def test_win_at_last_position_with_x
		player = Unbeatable.new('X')
		board_array = ['','','','','','','','X','X']
		assert_equal(6, player.get_move(board_array))
	end

	def test_win_at_4
		player = Unbeatable.new('X')
		board_array = ['X','','','','','','','','X']
		assert_equal(4, player.get_move(board_array))
	end

	def test_no_win
		player = Unbeatable.new('X')
		board_array = ['x','','','','','','','','']
		assert_equal(1, player.get_move(board_array))
	end

	def test_win_at_5
		player = Unbeatable.new('O')
		board_array = ['','','','O','O','','','','']
		assert_equal(5, player.get_move(board_array))
	end

	def test_win_at_last_with_o
		player = Unbeatable.new('O')
		board_array = ['','','','','','','','O','O']
		assert_equal(6, player.get_move(board_array))
	end

	def test_block1
		player = Unbeatable.new('O')
		board_array = ['X','X','','','','','','','']
		assert_equal(2, player.get_move(board_array))
	end

	def test_block2
		player = Unbeatable.new('X')
		board_array = ['O','','','','O','','','X','']
		assert_equal(8, player.get_move(board_array))
	end

	def test_block3
		player = Unbeatable.new('X')
		board_array = ['','','O','','','O','','X','']
		assert_equal(8, player.get_move(board_array))
	end

	def test_block4
		player = Unbeatable.new('O')
		board_array = ['X','','X','','X','O','','X','O']
		assert_equal(6, player.get_move(board_array))
	end

end