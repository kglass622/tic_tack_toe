require 'minitest/autorun'
require_relative 'sequential_AI.rb'

class TestSequentialAIFunction < Minitest::Test

    def test_create_new_player
        ai_player = Sequential_AI.new('X')
        assert_equal('X', ai_player.marker)
    end

    def test_ai_takes_first_open_position_0
        ai_player = Sequential_AI.new('X')
        assert_equal(0, ai_player.get_move(['','','','','','','','','']))
    end

    def test_ai_takes_first_open_position_1
        ai_player = Sequential_AI.new('X')
        assert_equal(1, ai_player.get_move(['X','','','','','','','','']))
    end

    def test_ai_takes_first_open_at_7
        ai_player = Sequential_AI.new('X')
        assert_equal(7, ai_player.get_move(['X','X','O','X','X','X','X','','']))
    end

end