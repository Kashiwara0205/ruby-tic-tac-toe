# frozen_string_literal: true

require_relative "const"
require_relative "tic_tac_toe_input_error"

# ゲームの"板"に関する情報を管理する
class Board
  attr_reader :board

  def initialize(board)
    @board = board
  end

  # 概要: 現在のプレイヤーのゲームの勝利判定
  # 引数:   piece: プレイヤーのコマ
  # 戻り値: 勝利している場合 => true
  #        それ以外 => false
  def win?(piece)
    # 横の判定
    return true if piece == @board[0][0] && piece == @board[0][1] && piece == @board[0][2]
    return true if piece == @board[1][0] && piece == @board[1][1] && piece == @board[1][2]
    return true if piece == @board[2][0] && piece == @board[2][1] && piece == @board[2][2]

    # 縦の判定
    return true if piece == @board[0][0] && piece == @board[1][0] && piece == @board[2][0]
    return true if piece == @board[0][1] && piece == @board[1][1] && piece == @board[2][1]
    return true if piece == @board[0][2] && piece == @board[1][2] && piece == @board[2][2]

    # 斜めの判定
    return true if piece == @board[0][0] && piece == @board[1][1] && piece == @board[2][2]
    return true if piece == @board[0][2] && piece == @board[1][1] && piece == @board[2][0]

    false
  end

  # 概要: コマを配置する場所があるかどうかを判定する
  # 引数: なし
  # 戻り値: コマを配置する場所がある => true
  #         コマを配置する場所がない => false
  def can_plase_piece?
    @board.any? { |row| row.any? { |a| EMPTY_SQUARE == a } }
  end

  # 概要: ゲーム板にコマを配置する
  # 引数: user_input_row: 入力された更新する行番号
  #      user_input_col: 入力された更新する列番号
  #      piece: プレイヤーのコマ
  # 戻り値: なし
  def update(user_input_row, user_input_col, piece)
    validate_input_value!(user_input_row, user_input_col)

    row = user_input_row.to_i
    col = user_input_col.to_i

    validate_place!(row, col)

    @board[row][col] = piece
  end

  # 説明: ゲーム板の状態をコンソールに出力する
  # 引数: なし
  # 戻り値: なし
  def print_board
    puts ""
    @board.each do |row|
      row.each do |e|
        print " N " if EMPTY_SQUARE == e
        print " o " if PLAYER1_PIECE == e
        print " x " if PLAYER2_PIECE == e
      end
      puts ""
    end
    puts ""
  end

  private

  # 概要: 正常な数値の範囲かどうかを検証する
  # 引数: row: 行番号, col: 列番号
  # 戻り値: なし
  def validate_input_value!(user_input_row, user_input_col)
    raise TicTacToeInputError, "行番号の入力に誤りがあります" if user_input_row !~ /^[0-2]$/
    raise TicTacToeInputError, "列番号の入力に誤りがあります" if user_input_col !~ /^[0-2]$/
  end

  # 概要: そのマスが既に埋まってないかどうか
  # 引数: row: 行番号, col: 列番号
  # 戻り値: なし
  def validate_place!(row, col)
    raise TicTacToeInputError, "このマスは既に埋まっています" if EMPTY_SQUARE != @board[row][col]
  end
end
