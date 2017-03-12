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

	
end