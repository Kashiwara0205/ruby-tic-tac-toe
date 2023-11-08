# frozen_string_literal: true

require_relative "const"
require_relative "game_manager"
require_relative "players/user_player"
require_relative "players/ordely_com_player"
require_relative "players/random_com_player"
require_relative "board"

# ゲームクラスを作成する
class GameFactory
  class << self
    def create(player1_name, player2_name)
      board = Board.new([
                          [OPEN_SLOT, OPEN_SLOT, OPEN_SLOT],
                          [OPEN_SLOT, OPEN_SLOT, OPEN_SLOT],
                          [OPEN_SLOT, OPEN_SLOT, OPEN_SLOT]
                        ])

      player1 = create_player(player1_name, PLAYER1_PIECE)
      player2 = create_player(player2_name, PLAYER2_PIECE)

      GameManager.new(
        player1: player1,
        player2: player2,
        board: board
      )
    end

    private

    def create_player(player_name, piece)
      return RandomComPlayer.new(piece: piece) if  RANDOM_COM_PLAYER == player_name
      return OrdelyComPlayer.new(piece: piece) if  OEDERLY_COM_PLAYER == player_name

      UserPlayer.new(piece: piece) if USER_PLAYER == player_name
    end
  end
end
