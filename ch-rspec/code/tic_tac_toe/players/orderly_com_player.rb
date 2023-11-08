# frozen_string_literal: true

require_relative "base_player"
require_relative "../const"
require_relative "../errors/com_error"

# OrdelyComPlayerクラス: 順番に見ていって空きマスがあれば配置する
class OrdelyComPlayer < BasePlayer
  def gets_piece_location(board_state)
    board_state.each_with_index do |row, i|
      row.each_with_index do |e, j|
        return [i, j] if OPEN_SLOT == e
      end
    end

    raise ComError, "OrderlyComPlayerクラスで配置場所が決まりませんでした"
  end
end
