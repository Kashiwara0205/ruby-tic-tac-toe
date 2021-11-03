# frozen_string_literal: true

# Playerの打ち手を管理をする
class Player
  class GetsPositionError < StandardError; end

  attr_reader :piece

  def initialize(piece:)
    @piece = piece
  end

  # 概要: コマを配置する行と列の値をコンソールから受け取り返却する
  # 引数: なし
  # 戻り値: 入力された行と列の情報を配列に格納して数値で返す => [1, 1]
  def select_position
    print "行を入力してください:"
    row = gets

    print "列を入力してください:"
    col = gets

    validate_position(row, col)
    [row.to_i, col.to_i]
  rescue GetsPositionError => e
    puts ""
    puts "入力項目に誤りがあります"
    puts e.message
    puts ""
    select_position
  rescue StandardError => e
    raise e
  end

  private

  # 概要: 正常な数値の範囲かどうかを検証する
  # 引数: row: 行番号, col: 列番号
  # 戻り値: なし
  def validate_position(row, col)
    raise GetsPositionError, "行番号の入力に誤りがあります" if row !~ /^[0-2]$/
    raise GetsPositionError, "列番号の入力に誤りがあります" if col !~ /^[0-2]$/
  end
end
