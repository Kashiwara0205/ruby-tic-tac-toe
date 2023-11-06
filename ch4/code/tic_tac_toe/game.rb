# frozen_string_literal: true

require_relative "const"
require_relative "tic_tac_toe_input_error"

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
    return false if @board.win?(@current_player.piece)
    return false if @board.win?(opponent_player(@current_player).piece)
    return false if !@board.exists_empty_square

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
    if @board.win?(@player1)
      puts "Player1が勝利しました!"
    elsif  @board.win?(@player2)
      puts "Player2が勝利しました!"
    else
      puts "引き分けです!"
    end
  end

  # 説明: ゲーム板の状態をコンソールに出力する
  # 引数: なし
  # 戻り値: なし
  def put_board
    puts ""
    @board.put_board
    puts ""
  end

  def execute_player_turn
    row, col = @current_player.select_position
    @board.update(row, col, @current_player.piece)
  rescue TicTacToeInputError => e
    puts ""
    puts e.message
    puts ""
    execute_player_turn
  rescue e
    raise e
  end

  private

  # 概要: 対戦中の相手プレイヤーを返却する
  # 引数: なし
  # 戻り値: PLAYER_1の時 => PLAYER_1
  #         PLAYER_2の時 => PLAYER_2
  def opponent_player(player)
    @player1.equal?(player) ? @player2 : @player1
  end
end
