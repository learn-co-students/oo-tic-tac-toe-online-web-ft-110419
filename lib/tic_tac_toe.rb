require 'pry'

class TicTacToe
  
  WIN_COMBINATIONS = [ 
    [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6] ]
  
  def initialize
    @board = Array.new(9, " ")
  end
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2] } "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5] } "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8] } "
  end
  def input_to_index(index)
    index.to_i - 1
  end
  def move(index, token)
    @board[index] = token
  end
  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end
  def valid_move?(index)
    if position_taken?(index) || index > 8 || index < 0 
      false 
    else
      true  
    end
  end
  def turn_count
    count = 0
    @board.each do |x|
      if x == "X" || x == "O"
        count += 1
      end
    end
    count
  end
  def current_player
    turn_count.even? ? "X" : "O"
  end
  def turn
    puts "Please select a number from 1-9"
    index = gets.chomp
    player = input_to_index(index)
    if valid_move?(player)
      move(player, current_player)
    else 
      turn
    end
    display_board
  end
  def won?
   win = WIN_COMBINATIONS.find do |combo|
      @board[combo[0]] == @board[combo[1]] && @board[combo[2]] == @board[combo[0]] && position_taken?(combo[0])
    end
    win
  end
  def full? 
    @board.all? {|x| x == "X" || x == "O"}
  end
  def draw?
    !won? && full?
  end
  def over?
    won? || draw?
  end
  def winner
    WIN_COMBINATIONS.detect do |combo| 
    if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X" 
      return "X"
    elsif @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
      return "O"
    else 
      nil
    end
    end
  end
  def play
    until over?
      turn
    end
    if won? 
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end