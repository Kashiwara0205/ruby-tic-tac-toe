require "minitest/autorun"
require_relative "../tic_tac_toe/tic_tac_toe_validator"
require_relative "../tic_tac_toe/errors/tic_tac_toe_input_error"

class TicTacToeValidatorTest < Minitest::Test

  # 概要: ユーザからの入力値が適切かどうかを判定し、範囲外の数字や文字が入ってきたらエラーとなる
  # 期待値: TicTacToeInputErrorの返却
  def test_validate_input_value
    e = assert_raises TicTacToeInputError do
        TicTacToeValidator.validate_input_value!("a", "0")
    end

    assert_equal '行番号の入力に誤りがあります', e.message

    e = assert_raises TicTacToeInputError do
      TicTacToeValidator.validate_input_value!("4", "0")
    end

    assert_equal '行番号の入力に誤りがあります', e.message

    e = assert_raises TicTacToeInputError do
      TicTacToeValidator.validate_input_value!("0", "a")
    end

    assert_equal '列番号の入力に誤りがあります', e.message

    e = assert_raises TicTacToeInputError do
      TicTacToeValidator.validate_input_value!("0", "4")
    end

    assert_equal '列番号の入力に誤りがあります', e.message
  end

  # 概要: 既に埋まっている場所にコマが配置されるとエラーとなる
  # 期待値: TicTacToeInputErrorの返却
  def test_validate_place
      e = assert_raises TicTacToeInputError do
          TicTacToeValidator.validate_place!(
            [
                [1, 0, 0],
                [1, 0, 0],
                [1, 0, 0],
            ],
            0,
            0
            )
      end

    assert_equal 'このマスは既に埋まっています', e.message
  end
end