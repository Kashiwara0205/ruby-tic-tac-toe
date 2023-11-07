# frozen_string_literal: true

require_relative "const"
require_relative "game_manager"
require_relative "player"
require_relative "board"

# ゲームクラスを作成する
class GameFactory
  class << self
    def create
      board = Board.new([
                          [OPEN_SLOT, OPEN_SLOT, OPEN_SLOT],
                          [OPEN_SLOT, OPEN_SLOT, OPEN_SLOT],
                          [OPEN_SLOT, OPEN_SLOT, OPEN_SLOT]
                        ])

      GameManager.new(player1: Player.new(piece: PLAYER1_PIECE), player2: Player.new(piece: PLAYER2_PIECE),
                      board: board)
    end
  end
end
