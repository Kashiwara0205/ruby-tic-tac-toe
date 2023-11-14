# frozen_string_literal: true

require_relative "base_player"
require_relative "../const"
require_relative "../errors/com_error"
require_relative "../randomizer"

# ランダムにコマを配置するCOM
class RandomComPlayer < BasePlayer
  TRY_COUNT = 1000

  # 概要: ゲーム板を受け取りランダムに場所を決めて空いてたら、その行と列番号を返却する
  # 引数: board_state: ゲーム板の状態
  # 戻り値: 行と列の情報を配列に格納して返却する => [1, 1]
  def gets_piece_location(board_state)
    TRY_COUNT.times do
      i = Randomizer.create
      j = Randomizer.create
      return [i, j] if OPEN_SLOT == board_state[i][j]
    end

    raise ComError, "RandomComPlayerクラスで配置場所が決まりませんでした"
  end
end
