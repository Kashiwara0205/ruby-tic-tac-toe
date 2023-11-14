# frozen_string_literal: true

require_relative "base_player"
require_relative "../const"
require_relative "../errors/com_error"

# MinMaxGameManagerが操作するプレイヤークラス
class CommandPlayer < BasePlayer
  def initialize(piece:)
    super(piece: piece)
    @row = 0
    @col = 0
  end

  # 概要: rowを更新する
  # 引数: row: 数値
  # 戻り値: なし
  def update_row(row)
    @row = row
  end

  # 概要: colを更新する
  # 引数: col: 数値
  # 戻り値: なし
  def update_col(col)
    @col = col
  end

  # 概要: 設定されたrowとcolを返却する
  # 引数: _board_state: ゲーム板の状態
  # 戻り値: 行と列の情報を配列に格納して返却する => [1, 1]
  def gets_piece_location(_game_data_map)
    [
      @row,
      @col
    ]
  end
end
