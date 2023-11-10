# frozen_string_literal: true

require_relative "const"
require_relative "game_manager"
require_relative "players/user_player"
require_relative "players/orderly_com_player"
require_relative "players/random_com_player"
require_relative "players/mini_max_com_player"
require_relative "board"

# ゲームマネージャークラスを作成する
class GameManagerFactory
  class << self
    # 概要: GameManagerクラスを作成し返却する
    # 引数: player1_name: plyaer1の名前。数値
    #      player2_name: plyaer2の名前。数値
    # 戻り値: GameManegerクラスのインスタンス
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
        board: board,
        starting_order: 1
      )
    end

    private

    # 概要: player_nameに応じてPlayerを作成する
    # 引数: player_name: plyaerの名前。数値
    # 戻り値: Playerクラスのインスタンス
    def create_player(player_name, piece)
      return RandomComPlayer.new(piece: piece) if  RANDOM_COM_PLAYER == player_name
      return OrdelyComPlayer.new(piece: piece) if  OEDERLY_COM_PLAYER == player_name
      return MinMaxComPlayer.new(piece: piece) if MINMAX_PLAYER == player_name

      UserPlayer.new(piece: piece) if USER_PLAYER == player_name
    end
  end
end
