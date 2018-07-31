This is a minimax class that I used in creating an unbeatable tic-tac-toe game, but should be implementable in other two-player board games relying only on player moves in a zero-sum game, like chess, checkers, and go.
(Although these games are much more complicated and would require the computer to terminate it's calculations much earlier, due to feasibility constraints.)

It uses the Minimax algorithm found in game theory to maximize values of play moves a computer player would use, while minimizing the opponent's possible play move values.

Utilizing recursion, the main method calls itself to iterate through all possible game moves, alternating players each time, and depending on the outcome (whether a tie, a win for the player, or a win for the opponent), it returns a point. Once it reaches the final play, it will return a 'best_move', being the space that ultimately returned the most points in the theoretical rest of the game.

To use this, a 'Game' class is required with a method for the game board, a method for determining which player may have won, requiring a player as an argument, and a method for determining a tie.
