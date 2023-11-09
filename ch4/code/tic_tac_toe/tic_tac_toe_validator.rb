# frozen_string_literal: true

require_relative "tic_tac_toe_input_error"
require_relative "const"

# 3目並べの入力地に対するバリデーションを実装するクラス
class TicTacToeValidator
  class << self
    # 概要: そのマスが既に埋まってないかどうかを検証する
    #       埋まっていた場合TicTacToeInputErrorをraiseする
    # 引数: board: 現在進行中のゲーム板, row: 行番号, col: 列番号
    # 戻り値: なし
    def validate_place!(board, row, col)
      raise TicTacToeInputError, "このマスは既に埋まっています" if OPEN_SLOT != board[row][col]
    end

    # 概要: ユーザからの入力値が適切かどうか
    #       0~2以外の数字や文字の場合TicTacToeInputErrorをraiseする
    # 引数: user_input_row: 行番号, user_input_col: 列番号
    # 戻り値: なし
    def validate_input_value!(user_input_row, user_input_col)
      raise TicTacToeInputError, "行番号の入力に誤りがあります" if user_input_row !~ /^[0-2]$/
      raise TicTacToeInputError, "列番号の入力に誤りがあります" if user_input_col !~ /^[0-2]$/
    end
  end
end
