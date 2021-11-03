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

  # 概要: コマの配置場所に関して検証するメソッドを担保する
  # 期待値: 数字以外が入力されたらエラーが発生
  #         -1以下、3以上の数字が入力されたらエラーが発生
  def test_validate_position
    player = Player.new(piece: 1)

    player.send(:validate_position, "0", "0")

    player.send(:validate_position, "2", "2")

    e = assert_raises Player::GetsPositionError do
      player.send(:validate_position, "a", "0")
    end

    assert_equal '行番号の入力に誤りがあります', e.message

    e = assert_raises Player::GetsPositionError do
        player.send(:validate_position, "0", "a")
      end
  
    assert_equal '列番号の入力に誤りがあります', e.message

    e = assert_raises Player::GetsPositionError do
        player.send(:validate_position, "-1", "0")
      end
  
    assert_equal '行番号の入力に誤りがあります', e.message

    e = assert_raises Player::GetsPositionError do
        player.send(:validate_position, "3", "0")
      end
  
    assert_equal '行番号の入力に誤りがあります', e.message

    e = assert_raises Player::GetsPositionError do
      player.send(:validate_position, "0", "-1")
    end

    assert_equal '列番号の入力に誤りがあります', e.message

    e = assert_raises Player::GetsPositionError do
      player.send(:validate_position, "0", "3")
    end
    
    assert_equal '列番号の入力に誤りがあります', e.message
  end
end