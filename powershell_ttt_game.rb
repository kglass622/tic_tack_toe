require_relative 'console_game.rb'

player1 = Sequential_AI.new('X')
player2 = Random_AI.new('O')

game = ConsoleGame.new(player1, player2)
game.intro

# game.display_board

# game.get_move

# game.update_position

# game.display_board

# game.change_player

# game.get_move

# game.update_position

# game.display_board

until game.check_winner
	game.display_board
	game.get_move
	game.update_position
	game.change_player

end