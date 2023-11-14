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

  # 概要: その場所にコマがあるかどうかを返却する
  # 引数: row: 行番号
  #       col: 列番号
  # 戻り値: コマがある => true
  #        コマがなし => false
  def piece?(row, col)
    @board.piece?(row, col)
  end

  # 概要: 現在プレイヤーが勝っているかどうかを返却する
  # 引数: なし
  # 戻り値: 勝利している => true
  #        勝利していない => false
  def win?
    @board.win?(@current_player.piece)
  end

  # 概要: 相手プレイヤーが勝っているかどうかを返却する
  # 引数: なし
  # 戻り値: 勝利している => true
  #        勝利していない => false
  def opponent_win?
    @board.win?(opponent_player(@current_player).piece)
  end

  # 概要: CommandPlayerが次に打つ手を更新する
  # 引数: row: 行番号
  #       col: 列番号
  # 戻り値: なし
  def set_piece_location(row, col)
    @current_player.update_row(row)
    @current_player.update_col(col)
  end

  # 概要: ゲーム板の状態を返却する
  # 引数:   なし
  # 戻り値: ゲーム板の状態
  def board_state
    @board.board_state
  end

  # 概要: 現在プレイヤーのコマを返却する
  # 引数: なし
  # 戻り値: プレイヤーのコマ
  def current_player_piece
    @current_player.piece
  end
end
