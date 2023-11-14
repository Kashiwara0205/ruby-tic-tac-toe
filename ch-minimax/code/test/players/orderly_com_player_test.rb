require "minitest/autorun"
require_relative "../../tic_tac_toe/players/orderly_com_player"
require_relative "../../tic_tac_toe/errors/com_error"

class OrderlyComPlayerTest < Minitest::Test
  # 概要:  空きマスを発見したら、その行番号と列番号が返ってくる
  # 期待値: 整数の0がrowとcolにそれぞれ返却されること
  def test_gets_piece_location
    player = OrdelyComPlayer.new(piece: 1)
    row, col = player.gets_piece_location([[0,0,0],[0,0,0],[0,0,0]])
    assert_equal 0, row
    assert_equal 0, col
  end

  # 概要:  空きマスが存在しない場合com_errorが発生する
  # 期待値: com_errorの発生とエラーメッセージの一致
  def test_error_when_no_open_slot
    player = OrdelyComPlayer.new(piece: 1)
    e = assert_raises ComError do
      player.gets_piece_location( [[1,1,1],[2,2,2],[2,1,1]])
    end

    assert_equal 'OrderlyComPlayerクラスで配置場所が決まりませんでした', e.message

  end
end