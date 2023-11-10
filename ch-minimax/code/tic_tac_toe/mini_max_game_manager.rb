# frozen_string_literal: true

require_relative "const"
require_relative "errors/tic_tac_toe_input_error"
require_relative "errors/com_error"
require_relative "tic_tac_toe_validator"
require_relative "players/commnad_player"

# MiniMaxが操作するGameManagerクラス
class MiniMaxGameManager < GameManager
  def initialize(board:, starting_order:)
    player1 = CommandPlayer.new(piece: PLAYER1_PIECE)
    player2 = CommandPlayer.new(piece: PLAYER2_PIECE)
    super(player1: player1, player2: player2, board: board, starting_order: starting_order)
  end

  def piece?(row, col)
    @board.piece?(row, col)
  end

  def win?
    @board.win?(@current_player.piece)
  end

  def opponent_win?
    @board.win?(opponent_player(@current_player).piece)
  end

  def set_piece_location(row, col)
    @current_player.update_row(row)
    @current_player.update_col(col)
  end

  def board_state
    @board.board_state
  end

  def current_player_piece
    @current_player.piece
  end
end
