
class TicTacToe

  attr_accessor :board
  
  WIN_COMBINATIONS = [
    [0, 1, 2], # top row
    [3, 4, 5], # middle row
    [6, 7, 8], # bottom row 
    [0, 3, 6], # left collumn
    [1, 4, 7], # middle collumn
    [2, 5, 8], # right collumn
    [0, 4, 8], # diagonal top to bottom
    [6, 4, 2] # diagonal bottom to top 
  ]
  
  def initialize
    @board = Array.new(9, " ")
  end
  
  def display_board
    puts " #{self.board[0]} | #{self.board[1]} | #{self.board[2]} "
    puts "-----------"
    puts " #{self.board[3]} | #{self.board[4]} | #{self.board[5]} "
    puts "-----------"
    puts " #{self.board[6]} | #{self.board[7]} | #{self.board[8]} "
  end
  
  def input_to_index(input)
    input.to_i - 1
  end
  
  def move(index, token = "X")
    self.board[index] = token
    self.board
  end
  
  def position_taken?(index)
    self.board[index].include?("X") || self.board[index].include?("O") ? true : false 
  end
  
  def valid_move?(index)
    if index.between?(0, 8) && !position_taken?(index)
      true
    else
      false
    end
  end
  
  def turn_count
    self.board.count {|position| position == "X" || position == "O"}
  end
  
  def current_player
    turn_count.even? ? "X" : "O"
  end
  
  def turn 
    puts "Choose a position between 1 (top left) and 9 (bottom right)"
    index = input_to_index(gets.chomp)
    while !valid_move?(index)
      puts "Invalid selection: Choose a position between 1 (top left) and 9 (bottom right)"
      index = input_to_index(gets.chomp)
    end
    move(index, current_player)
    display_board
  end
  
  def won?
    win = nil
	  WIN_COMBINATIONS.each do |combo_array|
		  win_check_array = []
		  combo_array.each do |index|
			  win_check_array << board[index]
		  end
		  if win_check_array.all? {|a| a == "X"}
        win = combo_array
      elsif win_check_array.all? {|a| a == "O"}
        win = combo_array
      else
        win
      end
	  end
    win
  end
  
  def full?
    self.board.all? {|position| position == "X" || position == "O"}
  end
  
  def draw?
    true if self.full? && !self.won?
  end
  
  def over?
    true if self.won? || self.draw?
  end
  
  def winner
    if won?
      self.board[won?[0]]
    else
      nil
    end
  end
  
  def play 
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
  
end











