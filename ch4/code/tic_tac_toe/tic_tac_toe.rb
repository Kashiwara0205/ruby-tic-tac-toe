# frozen_string_literal: true

require_relative "./game_factory"

# 三目並べの実行クラス
class TicTacToe
  # 概要: ゲームのmain部分
  #       このメソッドをコールするとゲームが始まる
  # 引数: なし
  # 戻り値: なし
  def self.start
    game = GameFactory.create()

    while game.continue?
      game.execute_player_turn()
      game.put_board()

      game.update_to_next_turn()
    end

    game.put_result()
  end
end
