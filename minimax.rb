# The Minimax algorithm is used to determine the best possible course of moves
# in a zero-sum two-player game

class Minimax
  def initialize(board, opponent, player)
      @board = board
      @opponent = opponent
      @player = player
  end

  def get_available_spaces(game_board)
    available_spaces = []
    game_board.each do |space|
      if space != "X" and space != "O"
        available_spaces << space
      end
    end
    return available_spaces
  end

  def is_opponent?(current_player)
    return true if current_player == @opponent
  end

  def get_next_player(current_player)
    is_opponent?(current_player) ? next_player = @player : next_player = @opponent
    return next_player
  end

  def get_min_or_max(current_player, best_score) # we want min score from opponent, max from player
    is_opponent?(current_player) ?
      best_move = best_score.min_by { |space, score| score }
      : best_move = best_score.max_by { |space, score| score }
    return best_move
  end

  def get_best_move(game, player, depth = 0, best_score = {}) #minimax algorithm
    game_board = game.game_board
    available_spaces = get_available_spaces(game_board)
    next_player = get_next_player(player)

    return -1 if game.game_is_over(game_board, @opponent)
    return 1 if game.game_is_over(game_board, @player)
    return 0 if game.tie?

    available_spaces.each do |available_space|
      game_board[available_space] = player # set space to player's symbol
      best_score[available_space] = get_best_move(game, next_player, depth += 1, {}) # record available space, score, switch players
      game_board[available_space] = available_space # reset space
    end

    best_move = get_min_or_max(player, best_score)
    # if depth reached the end of possibilites, best move has been found. otherwise, return score
    return (depth == available_spaces.length ? best_move[0] : best_move[1])
  end
end
