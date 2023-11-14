require "minitest/autorun"
require "./tic_tac_toe/tic_tac_toe"

class TicTacToeTest < Minitest::Test

  # 概要: コマの配置メソッドを担保する
  # 期待値: 入力した値に応じてコマが配置されること
  def test_place_piece
    board = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
    place_piece(board, 1, 0, 0)

    assert_equal 1, board[0][0]

    board = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
    place_piece(board, 2, 1, 1)

    assert_equal 2, board[1][1]
  end

  # 概要: 相手プレイヤーの取得メソッドを担保する
  # 期待値: 1を入力した場合は2が返却される
  #         2を入力した場合は1が返却される
  def test_get_opponent_player
    oppnent = get_opponent_player(1)
    assert_equal 2, oppnent

    oppnent = get_opponent_player(2)
    assert_equal 1, oppnent
  end

  # 概要: プレイヤーの勝利条件を担保
  # 期待値: 以下の条件時にtrueが返却される
  #         - プレイヤーのコマが横に三列揃っている
  #         - プレイヤーのコマが縦に三列揃っている
  #         - プレイヤーのコマが斜めに三列揃っている
  #        それ以外の場合はfalseが返却される
  def test_win?
    player = 1

    board = [[1, 1, 1], [0, 0, 0], [0, 0, 0]]
    assert win?(player, board)

    board = [[0, 0, 0], [1, 1, 1], [0, 0, 0]]
    assert win?(player, board)

    board = [[0, 0, 0], [0, 0, 0], [1, 1, 1]]
    assert win?(player, board)

    board = [[1, 0, 0], [1, 0, 0], [1, 0, 0]]
    assert win?(player, board)

    board = [[0, 1, 0], [0, 1, 0], [0, 1, 0]]
    assert win?(player, board)

    board = [[0, 0, 1], [0, 0, 1], [0, 0, 1]]
    assert win?(player, board)

    board = [[1, 0, 0], [0, 1, 0], [0, 0, 1]]
    assert win?(player, board)

    board = [[0, 0, 1], [0, 1, 0], [1, 0, 0]]
    assert win?(player, board)

    board = [[0, 0, 0], [0, 1, 1], [0, 0, 0]]
    assert_equal false, win?(player, board)

    board = [[0, 0, 0], [2, 2, 2], [0, 0, 0]]
    assert_equal false, win?(player, board)

    board = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
    assert_equal false, win?(player, board)
  end

  # 概要:  コマを置く場所が存在するかどうかの判定部分を担保する
  # 期待値: 以下の条件時にtrueが返却される
  #         - 置き場所がある
  #         以下の条件時にfalseが返却される
  #         - 置き場所がない
  def test_can_plase_piece?
    board = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
    assert can_plase_piece?(board)

    board = [[1, 1, 2], [2, 0, 1], [1, 2, 1]]
    assert can_plase_piece?(board)

    board = [[1, 1, 2], [2, 2, 1], [1, 2, 1]]
    assert_equal false, can_plase_piece?(board)
  end 

  # 概要:  ゲームの終了条件を担保する
  # 期待値: ゲームが進行可能な状態な時にfalseが返却される
  #         以下の条件時にtrueが返却される
  #         - プレイヤーが勝利した
  #         - 引き分けになった
  def test_over?
    player = 1

    board = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
    assert_equal false, over?(player, board)

    board = [[1, 2, 0], [0, 0, 0], [0, 0, 0]]
    assert_equal false, over?(player, board)

    board = [[1, 1, 1], [2, 2, 2], [0, 0, 0]]
    assert over?(player, board)

    board = [[1, 0, 2], [1, 1, 0], [0, 0, 2]]
    assert_equal false, over?(player, board)

    board = [[1, 1, 2], [2, 2, 1], [1, 2, 1]]
    assert over?(player, board)
  end

  # 概要:  コマを置く場所を取得した時に整数に変換されることを担保する
  # 期待値: 整数の1がrowとcolにそれぞれ返却されること
  def test_gets_piece_location
    stub(:print, nil) do 
      stub(:gets, "1") do 
        row, col = gets_piece_location()
        assert_equal 1, row
        assert_equal 1, col
      end
    end
  end

end