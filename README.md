

#### `#won?`

Your `#won?` method should return false/nil if there is no win combination present in the board and return the winning combination indexes as an array if there is a win. Use your `WIN_COMBINATIONS` constant in this method.

#### `#full?`

The `#full?` method should return true if every element in the board contains either an "X" or an "O".

#### `#draw?`

Build a method `#draw?` that returns `true` if the board is full and has not been won, `false` if the board is won, and `false` if the board is neither won nor full.

#### `#over?`

Build a method `#over?` that returns true if the board has been won or is full (i.e., is a draw).

#### `#winner`

Given a winning `@board`, the `#winner` method should return the token, `"X"` or `"O"`, that has won the game.

### Putting it all together: the `#play` method

#### `#play`

The play method is the main method of the Tic Tac Toe application and is responsible for the game loop. A Tic Tac Toe game must allow players to take turns, checking if the game is over after every turn. At the conclusion of the game, whether because it was won or ended in a draw, the game should report to the user the outcome of the game. You can imagine the pseudocode:

```
until the game is over
  take turns
end

if the game was won
  congratulate the winner
else if the game was a draw
  tell the players it ended in a draw
end
```

Run the tests for the `#play` method by typing `rspec spec/02_play_spec.rb` in your terminal.

### The CLI: `bin/tictactoe`

Your `bin/tictactoe` CLI should:

1. Instantiate an instance of `TicTacToe`
2. Start the game by calling `#play` on that instance.

<p data-visibility='hidden'>View <a href='https://learn.co/lessons/oo-tic-tac-toe' title='Tic Tac Toe in Ruby'>OO Tic Tac Toe</a> on Learn.co and start learning to code for free.</p>
