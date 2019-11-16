require 'pry'
class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8], [0,4,8],[2,4,6]
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

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, player_token = "X")
    @board[index] = player_token
  end

  def position_taken?(index)
    # @board[index] == " " ? false : true
    @board[index] == "X" || @board[index] == "O" ? true : false
  end

  def valid_move?(index)
    return true if @board[index] && !self.position_taken?(index)
  end

  def turn_count
    @board.count { |space| space != " " }
  end

  def current_player
    self.turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip

    # make sure input is valid
    self.turn if !user_input.to_i.between?(1, 9)

    index = self.input_to_index(user_input)
    self.turn if !self.valid_move?(index)

    self.move(index, current_player)
    self.display_board
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      combo.all? {|i| @board[i] == 'X'} ||
      combo.all? {|i| @board[i] == 'O'}
    end
  end

  def full?
    @board.detect {|space| space == " "} ? false : true
  end

  def draw?
    self.full? && !self.won? ? true : false
  end

  def over?
    self.won? || self.full? || self.draw? ? true : false
  end

  def winner
    if self.won?
      return self.current_player == 'X' ? "O" : "X"
    end
  end

  def play
    self.turn until self.over?
    puts "Congratulations #{self.winner}!" if self.won?
    puts "Cat's Game!" if self.draw?
  end
end