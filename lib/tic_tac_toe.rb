class TicTacToe
  
  WIN_COMBINATIONS = [
      [0,1,2], #top row
      [3,4,5], #middle row
      [6,7,8], #bottom row
      [0,3,6], #left column
      [1,4,7], #center column
      [2,5,8], #right column
      [0,4,8], #diagonal 1
      [2,4,6]  #diagonal 2
    ]
  
  def initialize
    @board = Array.new(9, " ")
  end 
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(str)
    str.to_i - 1
  end
  
  def move(index, token = "X")
    @board[index] = token
  end
  
  def position_taken?(index)
    @board[index] != " "
  end
  
  def valid_move?(index)
    !position_taken?(index) && index > -1 && index < 9
  end 
  
  def turn_count
    moves_on_board = @board.find_all {|positions| positions != " "}
    moves_on_board.count
  end
  
  def current_player
    turn_count.even? ? player = "X" : player = "O"
    player
  end
  
  def turn 
    puts "Please enter a position 1-9"
    input = gets.chomp
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player) 
    else 
      turn
    end
    display_board
  end 
  
  def won?
    win_status = false
    winning_combo = nil
    WIN_COMBINATIONS.each do |combo|
      combo_arr = [ @board[combo[0]] , @board[combo[1]], @board[combo[2]] ]
      if combo_arr.all?("X") 
        winning_combo = combo
        win_status = true
      elsif combo_arr.all?("O")
        winning_combo = combo
        win_status = true
      end
    end
    win_status ? winning_combo : win_status
  end
  
  def full?
    @board.any?(" ") ? false : true
  end 
  
  def draw?
    full? && !won?
  end 
  
  def over?
    won? || draw?
  end
  
  def winner 
    won? ? @board[won?[0]] : nil
  end 
  
  def play 
    until over?
      turn
    end 
    
    if won? 
      puts "Congratulations #{winner}!"
    else 
      puts "Cat's Game!"
    end
  end 
  
end