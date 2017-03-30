require 'minitest/autorun'
require_relative 'random_AI.rb'

class TestRandomAiFunction < Minitest::Test

    def test_create_new_player
        ai_player = Random_AI.new('X')
        assert_equal('X', ai_player.marker)
    end

    def test_full_board_except_1_position
        ai_player = Random_AI.new('X')
        assert_equal(4, ai_player.get_move(['X','X','X','X','','X','X','X','X']))
    end

    def test_random_ai_input_0_1_2
        ai_player = Random_AI.new('X')
        assert_equal(true, [0, 1, 2].include?(ai_player.get_move(['','','','X','X','X','X','X','X'])))
    end

    def test_empty_board_random_spot
        ai_player = Random_AI.new('X')
        assert_equal(true, [0, 1, 2, 3, 4, 5, 6, 7, 8,].include?(ai_player.get_move(['','','','','','','','',''])))
    end

end