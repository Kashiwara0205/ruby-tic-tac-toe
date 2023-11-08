require 'rspec'
require_relative "../tic_tac_toe/board"

RSpec.describe "ゲーム板の管理クラスを検証する" do

  context "勝利判定について" do 

    it "勝利している場合Trueが返却される" do
      player_piece = 1
      board = Board.new( [[1, 1, 1], [0, 0, 0], [0, 0, 0]])
      expect(board.win?(player_piece)).to eq(true)

      board = Board.new([[0, 0, 0], [1, 1, 1], [0, 0, 0]])
      expect(board.win?(player_piece)).to eq(true)

      board = Board.new([[0, 0, 0], [0, 0, 0], [1, 1, 1]])
      expect(board.win?(player_piece)).to eq(true)

      board = Board.new([[1, 0, 0], [1, 0, 0], [1, 0, 0]])
      expect(board.win?(player_piece)).to eq(true)

      board = Board.new([[0, 1, 0], [0, 1, 0], [0, 1, 0]])
      expect(board.win?(player_piece)).to eq(true)

      board = Board.new( [[0, 0, 1], [0, 0, 1], [0, 0, 1]])
      expect(board.win?(player_piece)).to eq(true)

      board = Board.new([[1, 0, 0], [0, 1, 0], [0, 0, 1]])
      expect(board.win?(player_piece)).to eq(true)

      board = Board.new([[0, 0, 1], [0, 1, 0], [1, 0, 0]])
      expect(board.win?(player_piece)).to eq(true)
    end

    it "勝利していない場合Falseが返却される" do
      player_piece = 1
      board = Board.new([[0, 0, 0], [0, 1, 1], [0, 0, 0]])
      expect(board.win?(player_piece)).to eq(false)

      board = Board.new([[0, 0, 0], [2, 2, 2], [0, 0, 0]])
      expect(board.win?(player_piece)).to eq(false)

      board = Board.new( [[0, 0, 0], [0, 1, 1], [0, 0, 0]])
      expect(board.win?(player_piece)).to eq(false)

      board = Board.new([[0, 0, 0], [0, 0, 0], [0, 0, 0]])
      expect(board.win?(player_piece)).to eq(false)

      board = Board.new( [[1, 1, 2], [2, 2, 1], [1, 2, 1]])
      expect(board.win?(player_piece)).to eq(false)
    end
  end

  context "コマを置く場所が存在するかどうかを検証する振る舞いについて" do 

    it "コマを置ける場合はTrueが返却される" do
      board = Board.new([[0, 0, 0], [0, 0, 0], [0, 0, 0]])
      expect(board.can_plase_piece?()).to eq(true)

      board = Board.new( [[1, 1, 2], [2, 0, 1], [1, 2, 1]] )
      expect(board.can_plase_piece?()).to eq(true)
    end

    it "コマを置けない場合はFalseが返却される" do
      board = Board.new( [[1, 1, 2], [2, 2, 1], [1, 2, 1]] )
      expect(board.can_plase_piece?()).to eq(false)
    end
  end

  context "ゲーム板の更新処理について" do 
    it "ゲーム板を更新する" do
      board = Board.new([[0, 0, 0], [0, 0, 0], [0, 0, 0]])
      board.update(0, 0, 1)
      expect(board.board_state[0][0]).to eq(1)
    end
    
    it "既にコマがある場合はTicTacToeInputErrorエラーが発生する" do
      board = Board.new([[1, 0, 0], [0, 0, 0], [0, 0, 0]])
      expect { board.update(0, 0, 1) }.to raise_error(TicTacToeInputError, "このマスは既に埋まっています")
    end
  end
end