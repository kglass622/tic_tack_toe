require 'minitest/autorun'

require_relative 'unbeatable.rb'



class TestUnbeatable < Minitest::Test



	def test_new_player_X

		player = Unbeatable.new('X')

		assert_equal('X', player.marker)

	end



	def test_for_win_at_2

		player = Unbeatable.new('X')

		ttt_board = ['X', 'X', '', '', '', '', '', '', '']

		assert_equal(2, player.get_win(ttt_board))

	end



	def test_win_at_last_pos_with_x

		player = Unbeatable.new('X')

		ttt_board = ['', '', '', '', '', '', '', 'X', 'X']

		assert_equal(6, player.get_win(ttt_board))

	end



	def test_win_at_4

		player = Unbeatable.new('O')

		ttt_board = ['', '', '', 'O', '', 'O', '', '', '']

		assert_equal(4, player.get_win(ttt_board))

	end



	def test_no_win

		player = Unbeatable.new('X')

		ttt_board = ['X', '', '', '', '', '', '', '', '']

		assert_equal(9, player.get_win(ttt_board))

	end



	def test_O_wins_at_8

		player = Unbeatable.new('O')

		ttt_board = ['', '', '', '', '', '', 'O', 'O', '']

		assert_equal(8, player.get_win(ttt_board))

	end



	def test_block_at_8

		player = Unbeatable.new('X')

		ttt_board = ['O', 'O', '', '', '', '', '', '', '']

		assert_equal(2, player.get_block(ttt_board))

	end



	def test_block_2

		player = Unbeatable.new('X')

		ttt_board = ['O', '', '', '', 'O', '', '', 'X', '']

		assert_equal(8, player.get_block(ttt_board))

	end



	def test_block_3

		player = Unbeatable.new('X')

		ttt_board = ['O', '', '', '', 'O', '', '', 'X', '']

		assert_equal(8, player.get_block(ttt_board))

	end



	def test_fork_win

		player = Unbeatable.new('X')

		ttt_board = ['X', 'O', '', 'O', '', '', 'X', '', '']

		assert_equal(4, player.win_check_fork(ttt_board))

	end



	def test_fork_win_2

		player = Unbeatable.new('X')

		ttt_board = ['X', '', '', '', 'O', '', '', '', 'X']

		assert_equal(2, player.win_check_fork(ttt_board))

	end



	def test_fork_block_1

		player = Unbeatable.new('X')

		ttt_board = ['', 'O', '', '', 'X', 'O', '', 'X', '']

		assert_equal(2, player.block_check_fork(ttt_board))

	end



	def test_fork_block_2

		player = Unbeatable.new('X')

		ttt_board = ['X', 'O', '', 'O', '', '', '', '', 'X']

		assert_equal(4, player.block_check_fork(ttt_board))

	end



	def test_fork_block_3

		player = Unbeatable.new('O')

		ttt_board = ['X', 'O', '', 'O', '', '', 'X', '', '']

		assert_equal(4, player.block_check_fork(ttt_board))

	end



	def test_weird_situation

		player = Unbeatable.new('O')

		ttt_board = ['X', '', '', '', 'O', '', '', '', 'X']

		assert_equal(3, player.block_check_fork(ttt_board))

	end



	def test_take_center

		player = Unbeatable.new('X')

		ttt_board = ['X', 'O', '', 'O', '', '', 'X', '', '']

		assert_equal(4, player.take_center(ttt_board))

	end



	def test_take_center_2

		player = Unbeatable.new('X')

		ttt_board = ['X', 'O', '', 'O', 'X', '', 'X', '', '']

		assert_equal(9, player.take_center(ttt_board))

	end



	def test_take_center_3

		player = Unbeatable.new('O')

		ttt_board = ['X', 'O', '', 'O', 'X', '', 'X', '', '']

		assert_equal(9, player.take_center(ttt_board))

	end



	def test_take_opposite_corner

		player = Unbeatable.new('O')

		ttt_board = ['X', 'O', '', 'O', 'X', '', 'X', '', '']

		assert_equal(8, player.take_corner(ttt_board))

	end



	def test_take_opposite_corner_O

		player = Unbeatable.new('X')

		ttt_board = ['O', 'X', '', 'X', 'O', '', 'O', '', '']

		assert_equal(8, player.take_corner(ttt_board))

	end



	def test_take_opposite_corner_6

		player = Unbeatable.new('O')

		ttt_board = ['X', 'O', '', 'O', 'X', '', 'X', '', 'X']

		assert_equal(2, player.take_corner(ttt_board))

	end



	def test_take_opposite_corner_zero

		player = Unbeatable.new('O')

		ttt_board = ['', 'O', 'O', 'O', 'X', '', 'X', '', 'X']

		assert_equal(0, player.take_corner(ttt_board))

	end



	def test_take_opposite_corner_six

		player = Unbeatable.new('O')

		ttt_board = ['X', 'O', '', 'O', 'X', '', 'X', '', 'X']

		assert_equal(2, player.take_corner(ttt_board))

	end



	def test_take_opposite_corner_two

		player = Unbeatable.new('X')

		ttt_board = ['X', 'O', '', 'O', 'X', '', 'X', '', 'X']

		assert_equal(2, player.take_empty_corner(ttt_board))

	end



	def test_take_empty_side_two

		player = Unbeatable.new('X')

		ttt_board = ['X', 'O', '', 'O', 'X', '', 'X', '', 'X']

		assert_equal(5, player.take_empty_side(ttt_board))

	end



	def test_take_empty_side_three

		player = Unbeatable.new('X')

		ttt_board = ['X', 'X', '', 'O', 'X', 'O', 'X', 'X', 'X']

		assert_equal(10, player.take_empty_side(ttt_board))

	end



	def test_take_the_win

		player = Unbeatable.new('X')

		ttt_board = ['X', 'X', '', 'O', 'X', 'O', 'X', '', 'O']

		assert_equal(2, player.get_move(ttt_board))

	end



	def test_block_the_win

		player = Unbeatable.new('X')

		ttt_board = ['', 'X', '', '', 'X', 'O', 'O', '', 'O']

		assert_equal(7, player.get_move(ttt_board))

	end



	def test_block_the_win_2

		player = Unbeatable.new('X')

		ttt_board = ['O', 'X', '', '', '', '', '', '', 'O']

		assert_equal(4, player.get_move(ttt_board))

	end



	def test_fork_the_win

		player = Unbeatable.new('X')

		ttt_board = ['X', 'O', '', 'O', '', '', 'X', '', '']

		assert_equal(4, player.get_move(ttt_board))

	end



	def test_block_fork_44

		player = Unbeatable.new('X')

		ttt_board = ['X', 'O', '', 'O', '', '', '', '', '']

		assert_equal(4, player.get_move(ttt_board))

	end





	def test_take_center_again

		player = Unbeatable.new('X')

		ttt_board = ['X', 'O', '', '', '', '', '', '', '']

		assert_equal(4, player.get_move(ttt_board))

	end



	def test_take_corner_44

		player = Unbeatable.new('X')

		ttt_board = ['X', 'O', 'X', 'O', 'X', '', '', '', '']

		assert_equal(6, player.get_move(ttt_board))

	end



	def test_take_empty_side_44

		player = Unbeatable.new('X')

		ttt_board = ['X', '', 'O', 'V', 'O', '', 'X', 'e', 'X']

		assert_equal(1, player.get_move(ttt_board))

	end



	def test_take_empty_random_44

		player = Unbeatable.new('X')

		ttt_board = ['e', 'h', 'e', 'V', 'O', 'h', 'e', '', 'e']

		assert_equal(7, player.get_move(ttt_board))

	end



end