require 'minitest/autorun'
require_relative 'random.rb'

class TestRandomAI < Minitest::Test
	
	def test_create_player
		player = Random.new('x')
		assert_equal('x', player.marker)
	end

	def test_open_position
		player = Random.new('x')
		assert_equal(0, player.get_move(['', 'x', 'o', 'x', 'x', 'o', 'x', 'o', 'o']))
	end

	def test_open_position_012
		player = Random.new('x')
		assert_equal(true, [0,1,2].include?(player.get_move(['', '', '', 'x', 'x', 'o', 'x', 'o', 'o'])))
	end

	def test_random_position
		player = Random.new('x')
		assert_equal(true, [0, 1, 2, 3, 4, 5, 6, 7, 8].include?(player.get_move(['', '', '', '', '', '', '', '', ''])))
	end



end