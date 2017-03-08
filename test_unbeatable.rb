require 'minitest/autorun'
require_relative 'unbeatable.rb'

class TestUnbeatable < Minitest::Test



	def test_create_player
		player = Unbeatable.new('X')
		assert_equal('X', player.marker)
	end









end