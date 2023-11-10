# frozen_string_literal: true

require_relative "base_player"
require_relative "../const"
require_relative "../errors/com_error"
require_relative "../min_max_game_manager"
require_relative "../board"

# MiniMaxルゴリズムを使って打ち手をきめるCOM
class MiniMaxComPlayer < BasePlayer
  def initialize(piece:)
    super(piece: piece)
    @best_locations = [0, 0]
  end

  def gets_piece_location(game_data_map)
    board = copy_board(game_data_map[:board_state])
    game = MinMaxGameManager.new(board: board, starting_order: @piece)

    minimax(game, 0)

    @locations = []
    @scores = []

    @best_locations
  end

  private

  def minimax(game, depth)
    return evaluate(game, depth) if !game.continue?

    depth += 1
    scores = []
    locations = []

    3.times do |row|
      3.times do |col|
        next if game.piece?(row, col)

        possible_game = copy_game(game)
        possible_game.set_piece_location(row, col)
        possible_game.player_turn
        possible_game.change_to_opponent_turn

        scores.push(minimax(
                      possible_game,
                      depth
                    ))
        locations.push([row, col])
      end
    end

    calc_best_score(game, scores, locations)
  end

  def calc_best_score(game, scores, locations)
    if game.current_player_piece == @piece

      max = scores.max
      max_index = scores.index(max)
      @best_locations = locations[max_index]

      max
    else
      min = scores.min
      min_index = scores.index(min)
      @best_locations = locations[min_index]

      min
    end
  end

  def copy_game(game)
    board = copy_board(game.board_state)
    MiniMaxComPlayer.new(board: board, starting_order: game.current_player_piece)
  end

  def copy_board(board_state)
    Board.new(Marshal.load(Marshal.dump(board_state)))
  end

  def evaluate(game, depth)
    return 10 - depth if game.win? && game.current_player_piece == @piece
    return depth - 10 if game.opponent_win? && game.current_player_piece == @piece

    return depth - 10 if game.win? && game.current_player_piece != @piece
    return 10 - depth if game.opponent_win? && game.current_player_piece != @piece

    0
  end
end
