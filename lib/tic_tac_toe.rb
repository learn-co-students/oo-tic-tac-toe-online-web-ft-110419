require "pry"
class TicTacToe
  WIN_COMBINATIONS = 
  [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [2,4,6],
  [0,4,8],
  [0,3,6],
  [1,4,7],
  [2,5,8]  
  ]
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end 
 
  
  def display_board 
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} " 
  end 
  
  def input_to_index(tac)
    tac.to_i - 1 
  end 
  
  def move(spot, player)
    @board[spot] = player
  end 
  
  def position_taken?(position) 
    @board[position] != " "  
  end 
  
  def valid_move?(move)
    return false if move > 8 ||  move < 0 || position_taken?(move)
    true 
  end 
  def turn_count  
    @board.count{|token| token == "X" || token == "O"}
  end 
  
  def current_player 
    return "X" if turn_count.even?  
    return "O" if turn_count.odd?
  end 
  
  def turn
    user_input = gets.strip
    c_p = current_player
    new_input = input_to_index(user_input)
    valid_move?(new_input) ? move(new_input, c_p) && display_board : user_input = gets.strip
  end 
  
  def won? 
    x = WIN_COMBINATIONS.find{|combe| @board[combe[0]] == "X" && @board[combe[1]] == "X" && @board[combe[2]] == "X" }
    o = WIN_COMBINATIONS.find{|combe| @board[combe[0]] == "O" && @board[combe[1]] == "O" && @board[combe[2]] == "O" }
    return x || o
  end 
  
  def full?
     true if !@board.any?{|input| input == "" || input == " "}
  end 
  
  def draw?
    !won? && full?
  end 
   
  def over?
     won? ? true : draw? 
  end 
  
  def winner 
    if won? 
      @board[won?[0]] == "X" ? "X" : "O"
    else
      nil
    end 
  end 
   
   def play 
     turn until over?
     if won? 
       puts "Congratulations #{winner}!"
     else 
        puts "Cat's Game!"
     end
   end 
   
end 
