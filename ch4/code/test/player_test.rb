require "minitest/autorun"
require_relative "../tic_tac_toe/player"

class PlayerTest < Minitest::Test
  # 概要:  コマを置く場所を取得した時に整数に変換されることを担保する
  # 期待値: 整数の1がrowとcolにそれぞれ返却されること
  def test_select_position
    player = Player.new(piece: 1)
    player.stub(:print, nil) do 
      player.stub(:gets, "1") do
        row, col = player.select_position()
        assert_equal 1, row
        assert_equal 1, col
      end
    end
  end
end