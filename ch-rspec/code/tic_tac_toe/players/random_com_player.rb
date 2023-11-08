# frozen_string_literal: true

require_relative "base_player"
require_relative "../const"
require_relative "../errors/com_error"
require_relative "../randomizer"

# ランダムにコマを配置する
class RandomComPlayer < BasePlayer
  TRY_COUNT = 1000

  def gets_piece_location(board_state)
    TRY_COUNT.times do
      i = Randomizer.create_random_index
      j = Randomizer.create_random_index
      return [i, j] if OPEN_SLOT == board_state[i][j]
    end

    raise ComError, "RandomComPlayerクラスで配置場所が決まりませんでした"
  end
end
