require 'pry'

class TicTacToe
  
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    input.to_i-1
  end
  
  def move(index, peice="X")
    @board[index] = peice
  end
  
  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end
  
  def valid_move?(index)
    if index.between?(0,8)
      if position_taken?(index) == true
        return false
      else 
        return true
      end
    end
    nil
  end
  
  def turn
    puts "enter position 1-9"
    input = gets
    index = input_to_index(input)
    peice = current_player
    if valid_move?(index)
        move(index, peice)
        display_board
    else
      puts "try again 1-9"
      gets
    end
  end
  
  def turn_count
    turn_number = 0
    @board.each.with_index do |position, index|
      if position_taken?(index)
        turn_number += 1
      end
    end
    turn_number
  end
  
  def current_player
    if turn_count.even?
      return "X"
    else
      return "O"
    end
  end
  
  def won?
    WIN_COMBINATIONS.each do |combo|
      if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
        return combo
      elsif @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
        return combo
      end
    end
    false
  end  
  
  def full?
    @board.each do |index|
     return nil if index == " "
    end
    true
  end

  def draw?
    if full? && won? == false
      true
    else
      false
    end
  end
  
  def over?
    if draw? || won?
      true
    else
      false
    end
  end

  def winner
    if won?
      @board[won?[0]]
    elsif draw?
      nil
    end
  end
  
  def play
    until over?
      turn
    end
    if won?
      if winner == "X"
        puts "Congratulations X!"
      elsif winner == "O"
        puts "Congratulations O!"
      end
    elsif draw?
      puts "Cat's Game!"
    end
  end
  

end