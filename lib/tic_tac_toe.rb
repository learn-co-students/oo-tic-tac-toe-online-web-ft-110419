require 'pry'

class TicTacToe
  
  
  def initialize 
    @board = Array.new(9, " ")
  end
  
      WIN_COMBINATIONS = [
      # Row win combinations
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      # Column win combinations
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      # Diagonal win combinations
      [0, 4, 8],
      [2, 4, 6]
      ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "--------------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "--------------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    input.to_i - 1
  end
  
  def move(coord, token = "X")
    @board[coord] = token
  end
  
  def position_taken?(index)
    if @board[index].include?(" ")
      false
    elsif @board[index] = "X" || @board[index] = "O"
      true
    end
  end
  
  def valid_move?(move = nil)
    if move > 8 || move < 0
      return false
    elsif !position_taken?(move) == true
      true
    else
      false
    end
  end

  
  def turn_count
    count = 0
    @board.each do |position| 
      if position == "X" || position == "O"
        count += 1
      end
    end
    count
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
    
  def turn
    puts "please input a position between 1-9"
    input = gets.to_i
    current_player #selects current player
    index = input_to_index(input)
  
    if valid_move?(index) == true
      move(index)
      display_board
    else
      puts "please input a valid position"
      input = gets.to_i
    end
  end
  
  def won?
    WIN_COMBINATIONS.collect do |combination|
      binding.pry
      if self.to_a.include?(combination)
        @board
        return
      else
        return false
      end
    end
        
   end
    
  
  
end