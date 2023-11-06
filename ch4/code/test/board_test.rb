require "minitest/autorun"
require_relative "../tic_tac_toe/board"

class BoardTest < Minitest::Test

  # 概要:  勝利判定部分のテスト
  # 期待値: 勝利判定時に、trueが返却。それ以外の状態の場合、falseが返却される
  def test_win?
    player_piece = 1
    board = Board.new( [[1, 1, 1], [0, 0, 0], [0, 0, 0]])
    assert board.win?(player_piece)

    board = Board.new( [[0, 0, 0], [1, 1, 1], [0, 0, 0]])
    assert board.win?(player_piece)

    board = Board.new( [[0, 0, 0], [0, 0, 0], [1, 1, 1]])
    assert board.win?(player_piece)

    board = Board.new( [[1, 0, 0], [1, 0, 0], [1, 0, 0]])
    assert board.win?(player_piece)

    board = Board.new( [[0, 1, 0], [0, 1, 0], [0, 1, 0]])
    assert board.win?(player_piece)

    board = Board.new( [[0, 0, 1], [0, 0, 1], [0, 0, 1]])
    assert board.win?(player_piece)

    board = Board.new( [[1, 0, 0], [0, 1, 0], [0, 0, 1]])
    assert board.win?(player_piece)

    board = Board.new( [[0, 0, 1], [0, 1, 0], [1, 0, 0]])
    assert board.win?(player_piece)

    board = Board.new( [[0, 0, 0], [0, 1, 1], [0, 0, 0]])
    assert_equal false, board.win?(player_piece)

    board = Board.new( [[0, 0, 0], [2, 2, 2], [0, 0, 0]])
    assert_equal false, board.win?(player_piece)

    board = Board.new( [[0, 0, 0], [0, 0, 0], [0, 0, 0]])
    assert_equal false, board.win?(player_piece)

    board = Board.new( [[1, 1, 2], [2, 2, 1], [1, 2, 1]])
    assert_equal false, board.win?(player_piece) 
  end
end