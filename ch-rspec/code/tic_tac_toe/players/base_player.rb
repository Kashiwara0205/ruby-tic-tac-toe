# frozen_string_literal: true

# Playerの打ち手を管理をする
class BasePlayer
  attr_reader :piece

  def initialize(piece:)
    @piece = piece
  end

  def gets_piece_location(_board_state)
    raise "gets_piece_locationを実装してください"
  end
end
