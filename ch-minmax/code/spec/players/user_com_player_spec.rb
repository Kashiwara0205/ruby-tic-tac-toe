require 'rspec'
require_relative "../../tic_tac_toe/players/user_player"
require_relative "../../tic_tac_toe/errors/tic_tac_toe_input_error"

RSpec.describe "UserPlayerについて" do

  context "コマの配置場所取得に関してテストする" do 

    it "ランダムに空きマスを発見したら行と列を返却する" do
      player = UserPlayer.new(piece: 1)
      allow(player).to receive(:print) { nil }
      allow(player).to receive(:gets) { "1" }
      row, col = player.gets_piece_location([[0,0,0],[0,0,0],[0,0,0]])
      expect(row).to eq(1)
      expect(col).to eq(1)
    end

    it "間違えた場所に配置した場合TicTacToeInputErrorが発生する" do
      player = UserPlayer.new(piece: 1)
      allow(player).to receive(:print) { nil }
      allow(player).to receive(:gets) { "4" }
      expect { player.gets_piece_location([[0,0,0],[0,0,0],[0,0,0]]) }.to raise_error(TicTacToeInputError, "行番号の入力に誤りがあります")
    end
  end
end