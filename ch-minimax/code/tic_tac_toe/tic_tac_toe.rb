# frozen_string_literal: true

require_relative "const"
require_relative "game_manager_factory"

# 三目並べの実行クラス
class TicTacToe
  class << self
    # 概要: ゲームのmain部分
    #       このメソッドをコールするとゲームが始まる
    # 引数: なし
    # 戻り値: なし
    def start
      game = GameManagerFactory.create(RANDOM_COM_PLAYER, MINIMAX_PLAYER)

      loop do
        game.player_turn
        game.print_board
        break if !game.continue?

        game.change_to_opponent_turn
      end

      game.print_result
    end
  end
end
