require 'pry'
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

  def input_to_index(string)
    input = string.to_i - 1
    input
  end

  def move(index, token = "X")
  @board[index] = token
  end

  def position_taken?(index)
    position = true
      if @board[index] == " "
      position = false
      end
    position
  end

# if position is taken it is not a valid move. It is false.
# if index is a number that is not allowed than it is returned false
  def valid_move?(index)
    if position_taken?(index)
      false
    elsif index < 0 || index > 8
      false
    else
      true
    end
  end

  def turn_count
  @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
  turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Play using numbers 1-9!"
    input = gets
    index = input_to_index(input)
    if valid_move?(index)
        move(index, current_player)
        display_board
    else
        input = gets
    end
  end

  #The logic is that we don't know the outcome like the spec does.
  #We don't actually know if the winning combo is [0,4,8]
  #This method should work on any winning combo.
  def won?
    WIN_COMBINATIONS.detect do |combo|
    @board[combo.first] == @board[combo[1]] &&
    @board[combo.first] == @board[combo[2]] &&
    @board[combo.first] != " "
    end
  end

  #Should return true for a draw
  #should return false if the board isn't filled
  #Should return true if every element in @board contains either an X or O
  # if the board length is less than 9 then it is not full.
  # if the board length has a winner or a draw then it is full.
  def full?
    @board.any? {|position| position == " "} ? false : true
  end

#Build a method #draw?
#that returns true if the board is full and has not been won,
#false if the board is won, and false if the board is neither won nor full.
  def draw?
  !self.won? && self.full? ? true : false
  end

  def over?
  won? || draw? || full?
  end
#Given a winning @board,
#the #winner method should return the token, "X" or "O",
#that has won the game.
#it should return X if X wins
#it should return O if O wins
#should return nil if draw
  def winner
    if won? #if won? iterates over detection of winning combo
      return @board[won?[0]] #returns the board[won? [index 0] which is equal to X or O]
    else
      return nil
    end
  end

#until the game is over
  #take turns
#end
#if the game was won
  #congratulate the winner
#else if the game was a draw
#  tell the players it ended in a draw
#end

#should ask for players input on a turn of the game
#should check if the game is over after every turn
#should play the first turn of the game
#should play the first few turns of the game
#should check if the game is won after every turn
#should check if the game is draw after every turn
#should stop playing if someone has won
#should congratulate the winner X
#should congratulate the winner O
#should stop playing in a draw
#should print "Cat\'s Game!" on a draw
#should play through an entire game

  def play
  "Hello players! Enter your input!"
  game_end = over?
    while !game_end do
      turn
      game_end = over?
    end
    if draw?
      puts "Cat's Game!"
    end
    if won?
     puts "Congratulations #{winner}!"
   end
  end

end
