# frozen_string_literal: true

require_relative "./const"
require_relative "./game"
require_relative "./player"

# ゲームクラスを作成する
class GameFactory
  class << self
    def create
      board = [
        [EMPTY_SQUARE, EMPTY_SQUARE, EMPTY_SQUARE],
        [EMPTY_SQUARE, EMPTY_SQUARE, EMPTY_SQUARE],
        [EMPTY_SQUARE, EMPTY_SQUARE, EMPTY_SQUARE]
      ]

      Game.new(player1: Player.new(piece: PLAYER1_PIECE), player2: Player.new(piece: PLAYER2_PIECE), board: board)
    end
  end
end
