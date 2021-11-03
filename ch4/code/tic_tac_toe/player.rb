# frozen_string_literal: true

class Player
   
  def initialize piece:
    @piece
  end

  # 概要: コマを配置する行と列の値をコンソールから受け取り返却する
  # 引数: なし 
  # 戻り値: 入力された行と列の情報を配列に格納して数値で返す => [1, 1]
  def gets_position
    print "行を入力してください:"
    row = gets

    print "列を入力してください:"
    col = gets
    [row.to_i, col.to_i]
  end
end