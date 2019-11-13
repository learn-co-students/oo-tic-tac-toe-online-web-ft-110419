require 'pry'
class TicTacToe
  WIN_COMBINATIONS = [
      [0,1,2],[3,4,5],[6,7,8],
      [0,3,6],[1,4,7],[2,5,8],
      [0,4,8],[2,4,6]
    ]
    
  def initialize
    @board = Array.new(9," ")
  end
  
  def display_board
    puts " X | O | O "
    puts "-----------"
    puts " X | X | X "
    puts " X | O | X "
    puts " O | X | X "
    puts " O | X | O "
  end
  
  def input_to_index(user_input)
    user_input.to_i - 1
  end
  
  def move(index,player_mark)
    @board[index] = player_mark
  end
  
  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end
  
  def valid_move?(index)
    # @board[index] != "X" && @board[index] != "O" && @board[index]
    !position_taken?(index) && index.between?(0,8)
  end
  
  def turn_count
    @board.count {|player|  player == "X" ||  player == "O"}
  end
  
  def current_player
    self.turn_count % 2 == 0 ? "X"  : "O"
  end
  
  def turn
    user_input = gets.chomp
    index = input_to_index(user_input)
    valid_move?(index) ? move(index,current_player) : turn
    display_board
  end
  
  def won?
    result = nil
    WIN_COMBINATIONS.each do |row|
      combo = "#{@board[row[0]]} #{@board[row[1]]} #{@board[row[2]]}".split(" ")
      plyr_x = combo.count{|plyr| plyr == "X"}

    	if plyr_x == 3 || plyr_x == 0 && combo.size == 3
    		result = "#{row[0]} #{row[1]} #{row[2]}".split.map{|n| n.to_i}
    		break result
    	end
    	
    end
    result
  end
  
  def full?
    board_values = @board.select {|value| value == "O" || value == "X"}
    board_values.size == @board.size
  end
  
  def draw?
    full? && !won? ? true : false
  end
  
  def over?
     full? || !!won? 
  end
  
  def winner
    won? ? @board[won?.first] : won?
  end
  
  def play
    until over?
      turn
    end
    puts winner ? "Congratulations #{winner}" : "Ended In A Draw"
  end
  
end