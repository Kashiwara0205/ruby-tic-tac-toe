require "minitest/autorun"
require_relative "../tic_tac_toe/game_manager"
require_relative "../tic_tac_toe/board"
class GameManagerTest < Minitest::Test

  # 概要: ゲームターンが更新され現在のプレイヤーが変わっていることを確認
  # 期待値: PLAYER_1ならPLAYER_2に
  #        PLAYER_2ならPLAYER_1に、それぞれ更新がかかる
  def test_change_to_opponent_turn
    player1 = MiniTest::Mock.new
    player2 = MiniTest::Mock.new

    player1.expect(:equal?, true, [player1])
    player1.expect(:equal?, false, [player2])

    board = Board.new(
      [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
    )

    game = GameManager.new(player1: player1, player2: player2, board: board)

    assert_equal player1.object_id, game.instance_variable_get(:@current_player).object_id

    game.change_to_opponent_turn()

    assert_equal player2.object_id, game.instance_variable_get(:@current_player).object_id

    game.change_to_opponent_turn()

    assert_equal player1.object_id, game.instance_variable_get(:@current_player).object_id
  end


 # 概要:  ゲームの継続条件を担保する
  # 期待値: ゲームが進行可能な状態な時にtrueが返却される
  #         以下の条件時にfalseが返却される
  #         - プレイヤーが勝利した
  #         - 引き分けになった
  def test_continue?

    # 継続可能
    player1 = MiniTest::Mock.new
    player1.expect(:piece, 1)

    player2 = MiniTest::Mock.new
    
    board = Board.new(
      [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
    )

    game = GameManager.new(player1: player1, player2: player2, board: board)
    assert game.continue?()

    player1.verify
    player2.verify
    
    # 継続可能
    player1 = MiniTest::Mock.new
    player1.expect(:piece, 1)

    player2 = MiniTest::Mock.new

    board = Board.new(
      [[1, 2, 0], [0, 0, 0], [0, 0, 0]]
    )

    game = GameManager.new(player1: player1, player2: player2, board: board)
    assert game.continue?()

    player1.verify
    player2.verify

    # 勝利した
    player1 = MiniTest::Mock.new
    player1.expect(:piece, 1)

    player2 = MiniTest::Mock.new

    board = Board.new(
      [[1, 1, 1], [2, 2, 0], [0, 0, 0]]
    )

    game = GameManager.new(player1: player1, player2: player2, board: board)
    assert_equal false, game.continue?()

    player1.verify

    # 引き分けになった
    player1.verify
    player2.verify

    player1 = MiniTest::Mock.new
    player1.expect(:piece, 1)

    player2 = MiniTest::Mock.new

    board = Board.new(
      [[1, 1, 2], [2, 2, 1], [1, 2, 1]]
    )

    game = GameManager.new(player1: player1, player2: player2, board: board)
    assert_equal false, game.continue?()

    player1.verify
    player2.verify

  end
end