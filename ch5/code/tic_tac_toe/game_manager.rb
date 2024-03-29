# frozen_string_literal: true

require_relative "const"
require_relative "errors/tic_tac_toe_input_error"
require_relative "errors/com_error"
require_relative "tic_tac_toe_validator"

# ゲームの進行状況を管理する
class GameManager
  def initialize(player1:, player2:, board:)
    @player1 = player1
    @player2 = player2
    @current_player = @player1
    @board = board
  end

  # 概要: ゲームが終了しているかどうかを返却する
  # 引数: なし
  # 戻り値: ゲームが続いている場合 => false
  #        ゲームが終わった場合 => true
  def over?
    return true if @board.win?(@current_player.piece)
    return false if @board.can_plase_piece?

    true
  end

  # 概要: 現在プレイ中のプレイヤーと相手プレイヤーを入れ替える
  # 引数: なし
  # 戻り値: なし
  def change_to_opponent_turn
    @current_player = opponent_player(@current_player)
  end

  # 概要: ゲームの結果をコンソールに出力する
  # 引数: なし
  # 戻り値: なし
  def print_result
    if @board.win?(@player1.piece)
      puts "Player1が勝利しました!"
    elsif @board.win?(@player2.piece)
      puts "Player2が勝利しました!"
    else
      puts "引き分けです!"
    end
  end

  # 説明: ゲーム板の状態をコンソールに出力する
  # 引数: なし
  # 戻り値: なし
  def print_board
    @board.print_board
  end

  # 説明: プレイヤーがコマを配置する場所を取得してターンを進める
  # 引数: なし
  # 戻り値: なし
  def player_turn
    row, col = @current_player.gets_piece_location(@board.board_state)
    @board.update(row, col, @current_player.piece)
  rescue TicTacToeInputError => e
    puts ""
    puts e.message
    puts ""
    player_turn
  rescue ComError => e
    puts ""
    puts e.message
    puts ""
  rescue e
    raise e
  end

  private

  # 概要: 対戦中の相手プレイヤーを返却する
  # 引数: なし
  # 戻り値: PLAYER_1の時 => PLAYER_2
  #        PLAYER_2の時 => PLAYER_1
  def opponent_player(player)
    @player1.equal?(player) ? @player2 : @player1
  end
end
