require 'rspec'
require_relative "../tic_tac_toe/tic_tac_toe_validator"
require_relative "../tic_tac_toe/errors/tic_tac_toe_input_error"

RSpec.describe "3目並べのバリデーションに関してテスト" do

  context "ユーザからの入力値に誤りがある場合" do 

    it "意図したエラークラスの返却" do
      expect { TicTacToeValidator.validate_input_value!("a", "0") }.to raise_error(TicTacToeInputError, "行番号の入力に誤りがあります")
      expect { TicTacToeValidator.validate_input_value!("4", "0") }.to raise_error(TicTacToeInputError, "行番号の入力に誤りがあります")
      expect { TicTacToeValidator.validate_input_value!("0", "a") }.to raise_error(TicTacToeInputError, "列番号の入力に誤りがあります")
      expect { TicTacToeValidator.validate_input_value!("0", "4") }.to raise_error(TicTacToeInputError, "列番号の入力に誤りがあります")
    end

  end

  context "ユーザからの入力値に誤りがない場合" do 

    it "エラーが返却されないことを担保" do
      expect { TicTacToeValidator.validate_input_value!("0", "0") }.not_to raise_error
      expect { TicTacToeValidator.validate_input_value!("2", "2") }.not_to raise_error
    end

  end

end