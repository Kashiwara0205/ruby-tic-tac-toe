# frozen_string_literal: true

require_relative "game_factory"

# 三目並べの実行クラス
class TicTacToe
  class << self
    # 概要: ゲームのmain部分
    #       このメソッドをコールするとゲームが始まる
    # 引数: なし
    # 戻り値: なし
    def start
      game = GameFactory.create

      while game.continue?
        game.player_turn
        game.print_board

        game.change_to_opponent_turn
      end

      game.print_result
    end
  end
end
