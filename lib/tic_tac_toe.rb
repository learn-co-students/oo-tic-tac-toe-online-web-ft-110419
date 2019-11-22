class TicTacToe
  attr_accessor :board
  
  WIN_COMBINATIONS =
    [
      [0,1,2],  
      [3,4,5], 
      [6,7,8], 
      [0,3,6], 
      [1,4,7], 
      [2,5,8], 
      [6,4,2], 
      [0,4,8], 
    ]

  def initialize
    board = Array.new(9) {|i| " " }
    @board =  board
  end

 def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
     index = user_input.to_i
     index -= 1
  end
  
  def move(user_input, token = "X")
    index = user_input.to_i
    @board[index = user_input.to_i] = token
  end

 def position_taken?(index)
    index = index.to_i
    if @board[index] == "X" || @board[index] == "O"
      return true
    else
      return false
    end
  end
  
def valid_move?(index)
    if position_taken?(index) || !index.between?(0,8)
      false
    else
      true
    end
  end
  
def turn
  "Please select a position on the board (1-9)"
  input = gets.strip
  index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
     turn
    end
end
   
  def turn_count
     if @board.count("X") + @board.count("O") <= 1
      turn_count = 1
     else
      turn_count = @board.count("X") + @board.count("O")
    end
  end
 
  def current_player
    if @board.count("X") <= @board.count("O")
      current_player = "X"
    else
      current_player = "O"
    end  
  end
 
 def won?
    WIN_COMBINATIONS.detect do |win_combination| 
    x_w = win_combination.all? { |win_index| @board[win_index] == "X" } || 
    o_w = win_combination.all? { |win_index| @board[win_index] == "O" } 
  end 
end

def full?
      @board.all? {|i| i == "X" || i == "O"}
end

def draw?
  full? && !won?
end

def over?
  won? || draw?
end

def winner
  WIN_COMBINATIONS.detect do |win_combination| 
    x_w = win_combination.all? { |win_index| @board[win_index] == "X" } 
    o_w = win_combination.all? { |win_index| @board[win_index] == "O" }
    if x_w && !o_w then return "X"
    elsif  o_w && !x_w then return "O"
    end
  end
end

def play 
until over?
  turn
end
if won?
  puts "Congratulations #{winner}!"
else if draw?
  puts "Cat's Game!"
end
end
end
end
game = TicTacToe.new