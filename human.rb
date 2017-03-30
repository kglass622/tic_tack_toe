class Human

    attr_accessor :marker

    def initialize(marker)
        @marker = marker
    end

    def get_move(board)

        print 'Please Enter 0-8 choose a move: '
        get_move = gets.chomp.to_i
    end

end