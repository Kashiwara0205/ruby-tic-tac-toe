require 'rspec'
require_relative "../../tic_tac_toe/players/random_com_player"
require_relative "../../tic_tac_toe/errors/com_error"
require_relative "../../tic_tac_toe/randomizer"

RSpec.describe "ランダムにコマを配置するCOMについて" do

  context "コマの配置ロジックに関してテストする" do 

    it "ランダムに空きマスを発見したら行と列を返却する" do
      player = RandomComPlayer.new(piece: 1)
      allow(Randomizer).to receive(:create_random_index) { 0 }
      row, col = player.gets_piece_location([[0,0,0],[0,0,0],[0,0,0]])
      expect(row).to eq(0)
      expect(col).to eq(0)
    end

    it "空きマスが発見できなかった場合ComErrorが発生する" do
      player = RandomComPlayer.new(piece: 1)
      expect { player.gets_piece_location([[1,1,1],[2,2,2],[2,1,1]]) }.to raise_error(ComError, "RandomComPlayerクラスで配置場所が決まりませんでした")
    end
  end
end