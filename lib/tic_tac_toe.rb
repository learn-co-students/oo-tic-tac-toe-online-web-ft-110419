require 'pry'
class TicTacToe
  
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5], 
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]
  def initialize(board = nil)
   @board = board || Array.new(9, " ") 
  end


  def display_board
    puts (" #{@board[0]} | #{@board[1]} | #{@board[2]} ") 
    puts "-----------"
    puts (" #{@board[3]} | #{@board[4]} | #{@board[5]} ")
    puts "-----------"
    puts (" #{@board[6]} | #{@board[7]} | #{@board[8]} ")
  end

  def input_to_index(input)
    input.to_i - 1 
  end

  def move(input, player)
    @board[input] = player
  end
    
  def position_taken?(input)
    @board[input] != ' '
  end

  def valid_move?(input)
    return_value = false
    return_value = true if !position_taken?(input) && (0..8).include?(input)
    return return_value
  end

  def turn_count
    count = 0
    @board.each do |box|
      count += 1 if box != (" ") 
    end
    count
  end

  def current_player
    return 'X' if turn_count.even? || turn_count == 0
    return 'O' if turn_count.odd?
  end

  def turn
    
    current_player = self.current_player
    
    puts "It's your turn #{current_player}" 
    puts 'Pick a spot on the board between 1 - 9'
    
    self.display_board 

    validate = false
    until validate == true
      
      input = gets.strip.to_i
      updated_input = self.input_to_index(input)
      
      validate = true if self.valid_move?(updated_input) 
      
      if !validate
        puts "Invalid selection. Please try again!" 
      end
      self.display_board
    end
    @board[updated_input] = current_player 
  end

  def won?
    WIN_COMBINATIONS.each {|c| #c == Combination of numbers
      return c if @board[c[0]] == @board[c[1]] && @board[c[1]] == @board[c[2]] && @board[c[0]] != ' '} 
    return false if full? 
  end

  def full?
    return true if self.turn_count == 9 
  end

  def draw?
    return true if full? && !won? 
  end

  def over?
    return true if draw? || won?
  end

  def winner()
    return nil if !won?
    @board[won?[0]]
  end

  def play
    until over?
      turn
    end

   puts "Congratulations #{winner}!" if won?
   puts "Cat's Game!" if draw?
   self.display_board
  end

end
