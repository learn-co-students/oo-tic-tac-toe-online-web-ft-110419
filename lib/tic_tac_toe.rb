class TicTacToe

  WIN_COMBINATIONS = [[0,1,2], [3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " "," ", " "]
  end

  def display_board
    print " " + @board[0] + " | " + @board[1] + " | " + @board[2] + " "
    print "-----------"
    print " " + @board[3] + " | " + @board[4] + " | " + @board[5] + " "
    print "-----------"
    print " " + @board[6] + " | " + @board[7] + " | " + @board[8] + " "
  end

  def input_to_index(choice)
      choice.to_i - 1
  end

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
   !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    if index >= 0 && index < 8
       return !position_taken?(index)
    else
      return false
    end
  end

  def turn_count
    turn = 0
    @board.each { |index|
     if index == "X" || index == "O"
       turn += 1
     end
     }
    return turn
  end

  def current_player
    player = turn_count
    if player.even?
      return "X"
    else
      return "O"
    end
  end

  def turn
    puts "Please choose a number 1-9"
    user_input = gets.chomp
    index = input_to_index(user_input)

    if valid_move?(index)
      player = current_player
      move(index,player)
      display_board
    else
       turn
    end
 end #end of turn

 def won?
  WIN_COMBINATIONS.map { |winner_combo|
   i0 = winner_combo[0]
   i1 = winner_combo[1]
   i2 = winner_combo[2]

    box1 = @board[i0]
    box2= @board[i1]
    box3 = @board[i2]

    if box1 == "X" && box2 == "X" && box3 == "X"
      return winner_combo
    elsif box1 == "O" && box2 == "O" && box3 == "O"
      return winner_combo
    end
    }
    return false
  end

  def full?
    @board.all? { |index| index == "O" || index == "X" }
  end

  def draw?
    if full? && !won?
      return true
    else
      return false
    end
  end

  def over?
    if won? || draw?
      return true
    else
      return false
    end
  end

  def winner
    index = []
    index = won?
    if index == false
      return nil
    else
      if @board[index[0]] == "X"
        return "X"
      else
        return "O"
      end
    end
  end

  def play
    until over? == true
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end #end of class
