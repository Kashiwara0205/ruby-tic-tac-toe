# 説明: ゲーム板の状態をコンソールに出力する
# 引数: board: ゲーム板, 3 x 3の二次元配列
# 戻り値: なし
def print_board board
  puts ""
  board.each do |row|
    row.each do |e|
      print " N " if 0 == e
      print " o " if 1 == e
      print " x " if 2 == e
    end
    puts ""
  end
  puts ""
end

# 説明: ゲームの勝利判定
# 引数: player: プレイヤーを表す。1 or 2の数値
#      board: ゲーム板, 3 x 3の二次元配列
# 戻り値: 勝利している場合 => true
#       それ以外 => false
def win? player, board

  # 横の判定
  return true if player == board[0][0] && player == board[0][1] && player == board[0][2]
  return true if player == board[1][0] && player == board[1][1] && player == board[1][2]
  return true if player == board[2][0] && player == board[2][1] && player == board[2][2]

  # 縦の判定
  return true if player == board[0][0] && player == board[1][0] && player == board[2][0]
  return true if player == board[0][1] && player == board[1][1] && player == board[2][1]
  return true if player == board[0][2] && player == board[1][2] && player == board[2][2]

  # 斜めの判定
  return true if player == board[0][0] && player == board[1][1] && player == board[2][2]
  return true if player == board[0][2] && player == board[1][1] && player == board[2][0]

  return false
end

# 説明: 対戦中の相手プレイヤーを返却する
# 引数: player: プレイヤーを表す。1 or 2の数値
# 戻り値: 1の時 => 2
#        2の時 => 1
def get_opponent_player player
  return player == 1 ? 2 : 1
end

# 説明: コマを配置する行と列の値をコンソールから受け取り返却する
# 引数: なし
# 戻り値: 入力された行と列の情報を配列に格納して数値で返す => [1, 1]
def gets_piece_location
  print "行を入力してください:"
  row = gets

  print "列を入力してください:"
  col = gets
  return row.to_i, col.to_i
end

# 説明: ゲーム板にコマを配置する
# 引数: board: ゲーム板, 3 x 3の二次元配列
#       player: プレイヤーを表す。1 or 2の数値
#       row: 更新する行番号
#       col: 更新する列番号
# 戻り値: なし
def place_piece board, player, row, col
  board[row][col] = player
end

# 説明: コマを配置する場所があるかどうかを判定する
# 引数: board: ゲーム板, 3 x 3の二次元配列
# 戻り値: コマを配置する場所がある => true
#         コマを配置する場所がない => false
def can_plase_piece? board
  return board.any?{|row| row.any?{|a| 0 == a} } 
end

# 説明: ゲームが続いているかどうかを返却する
# 引数: player: プレイヤーを表す。1 or 2の数値
#       board: ゲーム板, 3 x 3の二次元配列
# 戻り値: ゲームが続いている場合 => true
#        ゲームが終わった場合 => falsetest/tic_tac_toe_test.rb
def continue? player, board
  return false if win?(get_opponent_player(player), board)
  return true if can_plase_piece?(board)

  return false
end

# 説明: ゲームの結果をコンソールに出力する
# 引数: board: ゲーム板, 3 x 3の二次元配列
# 戻り値: なし
def print_result board
  if win?(1, board)
    puts "Player1が勝利しました!"
  elsif win?(2, board)
    puts "Player2が勝利しました!" 
  else
    puts "引き分けです!"
  end
end

player = 1
board = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]

while continue?(player, board)
  row, col = gets_piece_location()

  place_piece(board, player, row, col)

  print_board(board)

  player = get_opponent_player(player)
end

print_result(board)