require "pry"
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
        if !position_taken?(i) && i.between?(0,8)
          true
        else false
        end
      end
      def turn
        puts "Please enter 1-9:"
        i = gets.strip
        value = input_to_index(i)
        if valid_move?(value)
          move(value,current_player)
        else
          turn
        end
        display_board
      end

      def won?

          win = WIN_COMBINATIONS.find do |combo|
            @board[combo[0]]==@board[combo[1]]&&@board[combo[2]]== @board[combo[0]]&& !@board[combo[0]].empty?
          end

      end
      def full?
        @board.all? {|x| x=="X"||x=="O"}
      end
      def draw?
        !won? && full? ? true : false
      end
      def over?
        draw? || won? ? true : false
        end
        def winner
            WIN_COMBINATIONS.find do |combo|
              if @board[combo[0]]=="X"&&
                @board[combo[1]]=="X"&&
                @board[combo[2]]=="X"
                return "X"
              elsif @board[combo[0]]=="O"&&
                @board[combo[1]]=="O"&&
                @board[combo[2]]=="O"
                return "O"
              else nil
              end
            end
        end
        def play
          until over?
            turn
          end
          if won?
            puts "Congratulations #{winner}!"
          else draw?
            puts "Cat's Game!"
          end
        end
      def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
      end
end
