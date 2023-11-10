require 'rspec'
require_relative "../../tic_tac_toe/players/orderly_com_player"
require_relative "../../tic_tac_toe/errors/com_error"

RSpec.describe "順番にコマを配置するCOMについて" do

  context "コマの配置ロジックに関してテストする" do 

    it "空きマスを発見したら行と列を返却する" do
      player = OrdelyComPlayer.new(piece: 1)
      row, col = player.gets_piece_location([[0,0,0],[0,0,0],[0,0,0]])
      expect(row).to eq(0)
      expect(col).to eq(0)

      row, col = player.gets_piece_location([[1,0,0],[0,0,0],[0,0,0]])
      expect(row).to eq(0)
      expect(col).to eq(1)
    end

    it "空きマスが発見できなかった場合ComErrorが発生する" do
      player = OrdelyComPlayer.new(piece: 1)
      expect { player.gets_piece_location([[1,1,1],[2,2,2],[2,1,1]]) }.to raise_error(ComError, "OrderlyComPlayerクラスで配置場所が決まりませんでした")
    end
  end
end