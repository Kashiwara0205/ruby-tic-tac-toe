require "minitest/autorun"
require_relative "../../tic_tac_toe/players/user_player"
require_relative "../../tic_tac_toe/errors/tic_tac_toe_input_error"

class UserPlayerTest < Minitest::Test
  # 概要:  コマを置く場所を取得した時に整数に変換されることを担保する
  # 期待値: 整数の1がrowとcolにそれぞれ返却されること
  def test_gets_piece_location
    player = UserPlayer.new(piece: 1)
    player.stub(:print, nil) do 
      player.stub(:gets, "1") do
        row, col = player.gets_piece_location([[0,0,0],[0,0,0],[0,0,0]])
        assert_equal 1, row
        assert_equal 1, col
      end
    end
  end

  # 概要:  誤った場所にコマを配置する
  # 期待値: 整数の1がrowとcolにそれぞれ返却されること
  def test_put_piece_invalid_location
    player = UserPlayer.new(piece: 1)
    player.stub(:print, nil) do 
      player.stub(:gets, "4") do
        e = assert_raises TicTacToeInputError do
          player.gets_piece_location([[0,0,0],[0,0,0],[0,0,0]])
        end

        assert_equal '行番号の入力に誤りがあります', e.message

      end
    end
  end
end