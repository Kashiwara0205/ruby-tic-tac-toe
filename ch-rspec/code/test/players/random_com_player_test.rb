require "minitest/autorun"
require_relative "../../tic_tac_toe/players/random_com_player"
require_relative "../../tic_tac_toe/errors/com_error"
require_relative "../../tic_tac_toe/randomizer"

class RandomComPlayerTest < Minitest::Test
  # 概要:  ランダムに行番号と列番号が返ってくる(テストは0, 0で固定)
  # 期待値: 整数の0がrowとcolにそれぞれ返却されること
  def test_gets_piece_location
    player = RandomComPlayer.new(piece: 1)
    Randomizer.stub(:create_random_index, 0) do
      row, col = player.gets_piece_location([[0,0,0],[0,0,0],[0,0,0]])
      assert_equal 0, row
      assert_equal 0, col
    end
  end

  # 概要:  空きマスが存在しない場合com_errorが発生する
  # 期待値: com_errorの発生とエラーメッセージの一致
  def test_error_when_no_open_slot
    player = RandomComPlayer.new(piece: 1)
    e = assert_raises ComError do
      player.gets_piece_location([[1,1,1],[2,2,2],[2,1,1]])
    end

    assert_equal 'RandomComPlayerクラスで配置場所が決まりませんでした', e.message

  end
end