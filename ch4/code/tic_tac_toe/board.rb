# frozen_string_literal: true

require_relative "const"

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
  def exists_empty_square
    @board.any? { |row| row.any? { |a| EMPTY_SQUARE == a } }
  end

  # 概要: ゲーム板にコマを配置する
  # 引数: row: 更新する行番号
  #      col: 更新する列番号
  #      piece: プレイヤーのコマ
  # 戻り値: なし
  def update(row, col, piece)
    @board[row][col] = piece
  end

  # 説明: ゲーム板の状態をコンソールに出力する
  # 引数: なし
  # 戻り値: なし
  def put_board
    @board.each do |row|
      row.each do |e|
        print " N " if EMPTY_SQUARE == e
        print " o " if PLAYER1_PIECE == e
        print " x " if PLAYER2_PIECE == e
      end
      puts ""
    end
  end
end
