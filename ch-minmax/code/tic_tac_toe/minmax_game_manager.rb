# frozen_string_literal: true

require_relative "const"
require_relative "errors/tic_tac_toe_input_error"
require_relative "errors/com_error"
require_relative "tic_tac_toe_validator"
require_relative "players/commnad_player"

# MinMaxが操作するGameManagerクラス
class MinMaxGameManager < GameManager
  def initialize(board:)
    super(player1: CommandPlayer.new(PLAYER1_PIECE), player2: CommandPlayer.new(PLAYER2_PIECE), board: board)
  end

  def update_next_piece_location(row, col)
    @current_player.update_row(row)
    @current_player.update_col(col)
  end
end
