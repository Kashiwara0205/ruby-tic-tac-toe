# frozen_string_literal: true

require_relative "./const"
require_relative "./game"

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

# 概要: ゲームのmain部分
#       このメソッドをコールするとゲームが始まる
# 引数: なし
# 戻り値: なし
def start
  board = [
    [EMPTY_SQUARE, EMPTY_SQUARE, EMPTY_SQUARE],
    [EMPTY_SQUARE, EMPTY_SQUARE, EMPTY_SQUARE],
    [EMPTY_SQUARE, EMPTY_SQUARE, EMPTY_SQUARE]
  ]
  game = Game.new(player1: PLAYER_1, player2: PLAYER_2, board: board)

  while game.continue?
    row, col = gets_position

    game.place_piece(board, row, col)
    game.put_board(board)

    game.update_to_next_turn
  end

  put_result(board)
end
