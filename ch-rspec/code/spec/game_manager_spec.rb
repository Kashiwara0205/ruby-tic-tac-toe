require 'rspec'
require_relative "../tic_tac_toe/game_manager"
require_relative "../tic_tac_toe/players/user_player"

RSpec.describe "ゲームの進行クラスをテストする" do

  context "プレイヤー1とプレイヤー2のスイッチ処理について" do 

    it "プレイヤー1の場合プレイヤー2に切り替わる" do
      player1 = UserPlayer.new(piece: 1)
      player2 = UserPlayer.new(piece: 2)
      board = Board.new(
          [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
      )
      game = GameManager.new(player1: player1, player2: player2, board: board)

      expect(player1.object_id).to eq(game.instance_variable_get(:@current_player).object_id)

      game.change_to_opponent_turn()

      expect(player2.object_id).to eq(game.instance_variable_get(:@current_player).object_id)

      game.change_to_opponent_turn()

      expect(player1.object_id).to eq(game.instance_variable_get(:@current_player).object_id)
    end

  end

  context "プレイヤーターンの実行に関して" do

    it "プレイヤーターンを実行後にコマが配置されゲーム板が更新されることを担保する" do 
      player1 = instance_double( UserPlayer, {piece: 1, gets_piece_location: [2, 1]})
      player2 = instance_double( UserPlayer, {piece: 2})
      board = Board.new(
        [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
      )
      game = GameManager.new(player1: player1, player2: player2, board: board)
      game.player_turn()
      expect(1).to eq(board.board_state[2][1])
    end
  end

  context "ゲームの継続条件に関して" do

    it "空きマスがあるならゲームは進行可能とみなされる" do 
      player1 = UserPlayer.new(piece: 1)
      player2 = UserPlayer.new(piece: 2)
      board = Board.new(
        [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
      )
      game = GameManager.new(player1: player1, player2: player2, board: board)
      expect(game.over?()).to eq(false)


      board = Board.new(
        [[1, 2, 0], [0, 0, 0], [0, 0, 0]]
      )
      game = GameManager.new(player1: player1, player2: player2, board: board)
      expect(game.over?()).to eq(false)
    end

    it "自ターン完了後に3目揃っていた場合終了となる" do 
      player1 = UserPlayer.new(piece: 1)
      player2 = UserPlayer.new(piece: 2)
      board = Board.new(
        [[1, 1, 1], [2, 2, 0], [0, 0, 0]]
      )
      game = GameManager.new(player1: player1, player2: player2, board: board)
      expect(game.over?()).to eq(true)
    end

    it "引き分けの場合終了となる" do 
      player1 = UserPlayer.new(piece: 1)
      player2 = UserPlayer.new(piece: 2)
      board = Board.new(
        [[1, 1, 2], [2, 2, 1], [1, 2, 1]]
      )
      game = GameManager.new(player1: player1, player2: player2, board: board)
      expect(game.over?()).to eq(true)
    end
  end
end