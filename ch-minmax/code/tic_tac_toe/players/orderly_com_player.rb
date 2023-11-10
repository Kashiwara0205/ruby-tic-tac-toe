# frozen_string_literal: true

require_relative "base_player"
require_relative "../const"
require_relative "../errors/com_error"

# 順番に見ていって空きマスがあれば配置するCOM
class OrdelyComPlayer < BasePlayer
  # 概要: ゲーム板を受け取りマスを順番に見ていって空いてたら、その行と列番号を返却する
  # 引数: game_data_map: ゲーム関連の情報
  # 戻り値: 行と列の情報を配列に格納して返却する => [1, 1]
  def gets_piece_location(game_data_map)
    board_state = game_data_map[:board_state]

    board_state.each_with_index do |row, i|
      row.each_with_index do |e, j|
        return [i, j] if OPEN_SLOT == e
      end
    end

    raise ComError, "OrderlyComPlayerクラスで配置場所が決まりませんでした"
  end
end
