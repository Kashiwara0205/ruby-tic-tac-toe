# frozen_string_literal: true

# Playerの打ち手を管理をする
class Player

  class GetsPositionError < StandardError; end

   attr_reader :piece

  def initialize piece:
    @piece = piece
  end

  # 概要: コマを配置する行と列の値をコンソールから受け取り返却する
  # 引数: なし 
  # 戻り値: 入力された行と列の情報を配列に格納して数値で返す => [1, 1]
  def gets_position
   begin 
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
      gets_position()
    rescue => e
      raise e
    end
  end

  private 

  # 概要: 正常な数値の範囲かどうかを検証する
  # 引数: row: 行番号, col: 列番号 
  # 戻り値: なし
  def validate_position row, col
    raise GetsPositionError.new("行番号が数字で入力されていません") if !(row =~ /^[0-9]+$/)
    raise GetsPositionError.new("列番号が数字で入力されていません") if !(col =~ /^[0-9]+$/)
    row_i = row.to_i
    raise GetsPositionError.new("行番号の範囲に誤りがあります") if !(row_i >= 0 && row_i <= 2)
    col_i = col.to_i
    raise GetsPositionError.new("列番号の範囲に誤りがあります") if !(col_i >= 0 && col_i <= 2)
  end
end