class TicTacToe 
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
    ]
  def initialize(board=nil)
    @board = board || Array.new(9, " ")
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
 
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
 
  def display_board
    puts " #{@board[0]
    } | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(u)
    u.to_i-1
  end
  
  def move(m, p)
    @board[m] = p
  end
  
  def position_taken?(p)
    @board[p] != " "
  end
  
  def valid_move?(m)
    !position_taken?(m) && m >= 0 && m <= 9
  end
  
  def turn 
    player = current_player
    v = false 
    until v do
      puts "It's your turn #{player}, pick a spot(1-9): "
      input =  gets.strip
      input = input_to_index(input)
      v = valid_move?(input)
      if !v 
        puts "Sorry you cannot go there. Here is the board"
        display_board
      end
    end
    @board[input] = player
    display_board
  end
  
  def won? 
    WIN_COMBINATIONS.each{|w|
    return w if @board[w[0]] == @board[w[1]] && @board[w[1]]  == @board[w[2]] && @board[w[2]] != " "
    }
    return false if full?
  end
  
  def full? 
    return true if turn_count == 9
  end
  
  def draw? 
    return true if full? and !won?
  end
  
  def over? 
    return true if won? or draw?
  end 
  
  def winner 
    return nil if !won?
    @board[won?[0]]
  end
  
  def play 
    game_over = false 
    until game_over == true do
      turn
      game_over = over?
    end
    if won? 
      puts "Winner"
    else 
      puts "Draw"
    end
  end
end