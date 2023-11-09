# frozen_string_literal: true

require_relative "tic_tac_toe_validator"

# Playerの打ち手を管理をする
class Player
  attr_reader :piece

  def initialize(piece:)
    @piece = piece
  end

  # 概要: コマを配置する行と列の値をコンソールから受け取り返却する
  # 引数: なし
  # 戻り値: 入力された行と列の情報を配列に格納して返却する => [1, 1]
  def gets_piece_location
    print "行を入力してください:"
    user_input_row = gets

    print "列を入力してください:"
    user_input_col = gets

    TicTacToeValidator.validate_input_value!(user_input_row, user_input_col)

    [user_input_row.to_i, user_input_col.to_i]
  end
end
