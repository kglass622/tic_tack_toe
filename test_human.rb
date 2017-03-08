require 'minitest/autorun'
require_relative 'human.rb'

class TestUserPlayer < Minitest::Test

	def test_get_player_move
		player = Human.new('X')
		assert_equal(0, player.get_move('position'))
	end

end