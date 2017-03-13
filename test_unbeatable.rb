require 'minitest/autorun'
require_relative 'unbeatable.rb'

class TestUnbeatable < Minitest::Test

	def test_create_player
		player = Unbeatable.new('X')
		assert_equal('X', player.marker)
	end

	def test_win_at_second_pos_with_x
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

	def test_fork_1
		player = Unbeatable.new('X')
		board_array = ['X','O','','O','','','X','','']
		assert_equal(4, player.check_for_fork(board_array))
	end

	def test_fork_2
		player = Unbeatable.new('O')
		board_array = ['','x','','','O','X','','O','']
		assert_equal(6, player.check_for_fork(board_array))
	end

def test_block_fork
		player = Unbeatable.new('O')
		board_array = ['', 'X', '', '', 'O', 'X', '', 'O', '']
		assert_equal(2, player.block_fork(board_array))
	end

	def test_block_fork_2
		player = Unbeatable.new('X')
		board_array = ['O', 'X', '', 'X', '', '', 'O', '', '']
		assert_equal(4, player.block_fork(board_array))
	end

	def test_for_block_3
		player = Unbeatable.new('X')
		board_array = ['X', 'O', '', 'O', '', '', '', '', 'X']
		assert_equal(4, player.block_fork(board_array))
	end

	def test_block_fork_4
		player = Unbeatable.new('O')
		board_array = ['', 'O', '', 'X', 'O', '', '', 'X', '']
		assert_equal(6, player.block_fork(board_array))
	end

	#TAKE CENTER

	def test_take_center
		player = Unbeatable.new('O')
		board_array = ['', '', '', '', '', '', '', '', '']
		assert_equal(4, player.take_center(board_array))
	end

	def test_take_center_2
		player = Unbeatable.new('X')
		board_array = ['', '', 'X', 'O', '', '', 'X', 'O', '']
		assert_equal(4, player.take_center(board_array))
	end

	def test_take_filled_center_return_10
		player = Unbeatable.new('X')
		board_array = ['', '', 'X', 'O', 'O', '', 'X', 'O', '']
		assert_equal(10, player.take_center(board_array))
	end

	#TAKE CORNER

	def test_take_corner
		player = Unbeatable.new('X')
		board_array = ['O', '', '', '', '', '', '', '', '']
		assert_equal(8, player.opposite_corner(board_array))
	end

	def test_take_corner_2
		player = Unbeatable.new('O')
		board_array = ['', '', '', '', '', '', '', '', 'X']
		assert_equal(0, player.opposite_corner(board_array))
	end

	
end
	
	
	
	