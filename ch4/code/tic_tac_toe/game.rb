# frozen_string_literal: true

require_relative "./const"

# ゲームの進行状況を管理する
class Game
  attr_reader :player1, :player2

  def initialize(player1:, player2:, board:)
    @player1 = player1
    @player2 = player2
    @current_player = @player1
    @board = board
  end

  # 概要: ゲームが続いているかどうかを返却する
  # 引数: なし
  # 戻り値: ゲームが続いている場合 => true
  #        ゲームが終わった場合 => false
  def continue?

    return false if win?( @current_player)
    return false if lose?( @current_player)
    return false if !exists_empty_square

    true
  end

  # 概要: 現在のプレイ中のプレイヤーを更新し次のターンに移行する
  # 引数: なし
  # 戻り値: なし
  def update_to_next_turn
    @current_player = opponent_player(@current_player)
  end

  # 概要: ゲームの結果をコンソールに出力する
  # 引数: なし
  # 戻り値: なし
  def put_result
    if win?(@player1)
      puts "Player1が勝利しました!"
    elsif win?(@player2)
      puts "Player2が勝利しました!"
    else
      puts "引き分けです!"
    end
  end

  # 説明: ゲーム板の状態をコンソールに出力する
  # 引数: なし
  # 戻り値: なし
  def put_board()
    puts ""
    @board.each do |row|
      row.each do |e|
        print " N " if EMPTY_SQUARE == e
        print " o " if PLAYER_1 == e
        print " x " if PLAYER_2 == e
      end
      puts ""
    end
    puts ""
  end

  def execute_player_turn()
    row, col =  @current_player.gets_position
    place_piece(row, col)
  end

  private

  # 概要: ゲーム板にコマを配置する
  # 引数: row: 更新する行番号
  #       col: 更新する列番号
  # 戻り値: なし
  def place_piece(row, col)
    @board[row][col] = @current_player.piece
  end

  # 概要: 対戦中の相手プレイヤーを返却する
  # 引数: なし
  # 戻り値: PLAYER_1の時 => PLAYER_1
  #         PLAYER_2の時 => PLAYER_2
  def opponent_player(player)
    @player1.object_id == player.object_id ? @player2 : @player1
  end

  # 概要: コマを配置する場所があるかどうかを判定する
  # 引数: なし
  # 戻り値: コマを配置する場所がある => true
  #         コマを配置する場所がない => false
  def exists_empty_square
    @board.any? { |row| row.any? { |a| EMPTY_SQUARE == a } }
  end

  # 概要: 現在のプレイヤーのゲームの勝利判定
  # 引数:  player: プレイヤー
  # 戻り値: 勝利している場合 => true
  #        それ以外 => false
  def win?(player)
    piece = player.piece

    # 横の判定
    return true if piece == @board[0][0] && piece == @board[0][1] && piece == @board[0][2]
    return true if piece == @board[1][0] && piece == @board[1][1] && piece == @board[1][2]
    return true if piece == @board[2][0] && piece == @board[2][1] && piece == @board[2][2]

    # 縦の判定
    return true if piece == @board[0][0] && piece == @board[1][0] && piece == @board[2][0]
    return true if piece == @board[0][1] && piece == @board[1][1] && piece == @board[2][1]
    return true if piece == @board[0][2] && piece == @board[1][2] && piece == @board[2][2]

    # 斜めの判定
    return true if piece == @board[0][0] && piece == @board[1][1] && piece == @board[2][2]
    return true if piece == @board[0][2] && piece == @board[1][1] && piece == @board[2][0]

    false
  end

  # 概要: 現在のプレイヤーのゲームの敗北判定
  # 引数:  piece: プレイヤーのコマ
  # 戻り値: 敗北している場合 => true
  #         それ以外 => false
  def lose?(player)
    win?(opponent_player(player))
  end
end
