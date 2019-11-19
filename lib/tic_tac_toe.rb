class TicTacToe
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],
                    [0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
      def initialize(board = nil)
        @board = board || Array.new(9, " ")
      end
      def current_player
        turn_count % 2 == 0 ? "X" : "O"
      end
      def turn_count
        @board.count{|token| token == "X" || token == "O"}
      end
      def input_to_index(i)
      value = i.to_i
        value-1
      end
      def move(i,token="X")
        @board[i] = token
      end
      def position_taken?(i)
        if  @board[i]==" "
          false
        else true
        end
      end
      def valid_move?(i)
        if @board[i]==" "
          true
        else false
        end
      end
      def turn()
        puts "Please enter 1-9:"
        i = gets
        value = i.to_i

        if valid_move?(value) == true
          move(input_to_index(value),current_player)

        elsif valid_move?(value)==false
          puts "Please enter 1-9:"
          i = gets
        else
        end
        puts display_board
      end
      def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
      end
end
