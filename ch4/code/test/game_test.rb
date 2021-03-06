require "minitest/autorun"
require_relative "../tic_tac_toe/game"

class GameTest < Minitest::Test

  # 概要: ゲームターンが更新され現在のプレイヤーが変わっていることを確認
  # 期待値: PLAYER_1ならPLAYER_2に
  #         PLAYER_2ならPLAYER_1に、それぞれ更新がかかる
  def test_place_piece
    player1 = MiniTest::Mock.new
    player2 = MiniTest::Mock.new

    game = Game.new(player1: player1, player2: player2, board: [[0, 0, 0], [0, 0, 0], [0, 0, 0]])

    assert_equal player1.object_id, game.instance_variable_get(:@current_player).object_id

    game.update_to_next_turn()

    assert_equal player2.object_id, game.instance_variable_get(:@current_player).object_id

    game.update_to_next_turn()

    assert_equal player1.object_id, game.instance_variable_get(:@current_player).object_id
  end

  # 概要: プレイヤーがコマを配置した時に、ボードが更新されることを担保する
  # 期待値: select_positionメソッドからの戻り値で、ボードが更新されること
  def test_execute_player_turn
    player1 = MiniTest::Mock.new
    player1.expect(:select_position, [0, 0])
    player1.expect(:piece, 1)

    player2 = MiniTest::Mock.new
    player2.expect(:select_position, [1, 2])
    player2.expect(:piece, 2)

    game = Game.new(player1: player1, player2: player2, board: [[0, 0, 0], [0, 0, 0], [0, 0, 0]])

    game.execute_player_turn()
    board = game.instance_variable_get(:@board)
    assert_equal 1, board[0][0]

    game.update_to_next_turn()

    game.execute_player_turn()
    board = game.instance_variable_get(:@board)
    assert_equal 2, board[1][2]

    player1.verify
    player2.verify
  end

  # 概要:  ゲームの継続条件を担保する
  # 期待値: ゲームが進行可能な状態な時にtrueが返却される
  #         以下の条件時にfalseが返却される
  #         - プレイヤーが勝利した
  #         - プレイヤーが敗北した
  #         - 引き分けになった
  def test_continue?

    # 継続可能
    player1 = MiniTest::Mock.new
    player1.expect(:piece, 1)
    
    player2 = MiniTest::Mock.new
    player2.expect(:piece, 2)

    game = Game.new(player1: player1, player2: player2, board: [[0, 0, 0], [0, 0, 0], [0, 0, 0]])
    assert game.continue?()

    player1.verify
    player2.verify

    # 継続可能
    player1 = MiniTest::Mock.new
    player1.expect(:piece, 1)

    player2 = MiniTest::Mock.new
    player2.expect(:piece, 2)

    game = Game.new(player1: player1, player2: player2, board: [[1, 2, 0], [0, 0, 0], [0, 0, 0]])
    assert game.continue?()

    player1.verify
    player2.verify

    # 勝利した
    player1 = MiniTest::Mock.new
    player1.expect(:piece, 1)
    
    player2 = MiniTest::Mock.new

    game = Game.new(player1: player1, player2: player2, board: [[1, 1, 1], [0, 0, 0], [0, 0, 0]])
    assert_equal false, game.continue?()

    player1.verify

    # 敗北した
    player1 = MiniTest::Mock.new
    player1.expect(:piece, 1)
    
    player2 = MiniTest::Mock.new
    player2.expect(:piece, 2)

    game = Game.new(player1: player1, player2: player2, board: [[2, 2, 2], [0, 0, 0], [0, 0, 0]])
    assert_equal false, game.continue?()

    # 引き分けになった
    player1.verify
    player2.verify

    player1 = MiniTest::Mock.new
    player1.expect(:piece, 1)
    
    player2 = MiniTest::Mock.new
    player2.expect(:piece, 2)

    game = Game.new(player1: player1, player2: player2, board: [[1, 1, 2], [2, 2, 1], [1, 2, 1]])
    assert_equal false, game.continue?()

    player1.verify
    player2.verify
  end
end