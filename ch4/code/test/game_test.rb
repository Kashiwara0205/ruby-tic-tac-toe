require "minitest/autorun"
require_relative "../tic_tac_toe/game"

class GameTest < Minitest::Test

  # 概要: ゲームターンが更新され現在のプレイヤーが変わっていることを確認
  # 期待値: PLAYER_1ならPLAYER_2に
  #         PLAYER_2ならPLAYER_1に、それぞれ更新がかかる
  def test_place_piece
    game = Game.new(player1: 1, player2: 2, board: [[0, 0, 0], [0, 0, 0], [0, 0, 0]])

    assert_equal 1, game.instance_variable_get(:@current_player)

    game.update_to_next_turn()

    assert_equal 2, game.instance_variable_get(:@current_player)

    game.update_to_next_turn()

    assert_equal 1, game.instance_variable_get(:@current_player)
  end

  # 概要: コマの配置メソッドを担保する
  # 期待値: 入力した値に応じてコマが配置されること
  def test_place_piece
    game = Game.new(player1: 1, player2: 2, board: [[0, 0, 0], [0, 0, 0], [0, 0, 0]])

    game.place_piece(0, 0)
    board = game.instance_variable_get(:@board)
    assert_equal 1, board[0][0]

    game.update_to_next_turn()

    game.place_piece(1, 2)
    board = game.instance_variable_get(:@board)
    assert_equal 2, board[1][2]
  end

  # 概要:  ゲームの継続条件を担保する
  # 期待値: ゲームが進行可能な状態な時にtrueが返却される
  #         以下の条件時にfalseが返却される
  #         - プレイヤーが勝利した
  #         - プレイヤーが敗北した
  #         - 引き分けになった
  def test_continue?
    game = Game.new(player1: 1, player2: 2, board: [[0, 0, 0], [0, 0, 0], [0, 0, 0]])
    assert game.continue?()

    game = Game.new(player1: 1, player2: 2, board: [[1, 2, 0], [0, 0, 0], [0, 0, 0]])
    assert game.continue?()

    game = Game.new(player1: 1, player2: 2, board: [[1, 1, 1], [0, 0, 0], [0, 0, 0]])
    assert_equal false, game.continue?()

    game = Game.new(player1: 1, player2: 2, board: [[2, 2, 2], [0, 0, 0], [0, 0, 0]])
    assert_equal false, game.continue?()

    game = Game.new(player1: 1, player2: 2, board: [[1, 1, 2], [2, 2, 1], [1, 2, 1]])
    assert_equal false, game.continue?()
  end
end