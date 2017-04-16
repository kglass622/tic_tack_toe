class Board

    attr_accessor :ttt_board

    def initialize
        @ttt_board = Array.new(9, ' ')
    end


    def update_position(position, marker)
        ttt_board[position] = marker
    end


    def open_position?(position)
        if ttt_board[position] == ' '
            true
        else
            false 
        end
    end


    def valid_input?(input)

        if input.match(/[XxOo]/) && input.length == 1
            true
        else
            false
        end
    end


    def full_board?()

        if ttt_board.include?(' ')
            false
        else
            true
        end
    end


    def winner?(marker)

    win_array = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]] 

    results = false

        win_array.each do |win|
            row = 0

            win.each do |pos|


                if ttt_board[pos] == marker
                    row += 1

                    if row == 3
                        results = true
                    end
                end
            end
        end
        results
    end


    
end



# class Player

#   attr_accessor :name, :marker

#   def initialize
#       print 'Enter your name here: '
#       @name = gets.chomp

#       print 'Enter X or O to choose your marker: '
#       @marker = gets.chomp
#   end


# end


# class Game


#   def final_game(marker)
        
#       final = open_position?(marker)
#       valid_input?(final)

#           if winner?(final) == true
#               print @name + ' wins!'
#           else 
#               print 'Tie game!'
#           end
#   end

# end



							



