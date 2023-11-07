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

  # 概要:  コマを置く場所が存在するかどうかの判定部分を担保する
  # 期待値: 以下の条件時にtrueが返却される
  #         - 置き場所がある
  #         以下の条件時にfalseが返却される
  #         - 置き場所がない
  def test_can_plase_piece?
    board = Board.new([[0, 0, 0], [0, 0, 0], [0, 0, 0]])
    assert board.can_plase_piece?()

    board = Board.new( [[1, 1, 2], [2, 0, 1], [1, 2, 1]] )
    assert board.can_plase_piece?()

    board = Board.new( [[1, 1, 2], [2, 2, 1], [1, 2, 1]] )
    assert_equal false, board.can_plase_piece?()
  end

  # 概要:  指定した場所にコマを配置できるかどうか
  # 期待値: board[0, 0]にコマ1が代入されること
  def test_update?
    board = Board.new([[0, 0, 0], [0, 0, 0], [0, 0, 0]])
    board.update(0, 0, 1)
    assert_equal 1, board.board_state[0][0]
  end

  # 概要:  既に配置してある場所にコマを入力したらエラーが出ることを確認する
  # 期待値: board[0, 0]にコマ1が代入されること
  def test_update?
    board = Board.new([[1, 0, 0], [0, 0, 0], [0, 0, 0]])
    e = assert_raises TicTacToeInputError do
      board.update(0, 0, 1)
    end
    assert_equal 'このマスは既に埋まっています', e.message
  end
end