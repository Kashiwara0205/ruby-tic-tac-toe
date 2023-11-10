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

  def update_row(row)
    @row = row
  end

  def update_col(col)
    @col = col
  end

  def gets_piece_location(_game_data_map)
    [
      @row,
      @col
    ]
  end
end