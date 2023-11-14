# frozen_string_literal: true

require_relative "base_player"
require_relative "../const"
require_relative "../errors/com_error"
require_relative "../mini_max_game_manager"
require_relative "../board"

# MiniMaxルゴリズムを使って打ち手をきめるCOM
class MiniMaxComPlayer < BasePlayer
  def initialize(piece:)
    super(piece: piece)
    @best_locations = [0, 0]
  end

  # 概要: MiniMaxアルゴリズムを使用して打ち手を決定する
  # 引数: board_state: ゲーム板の状態
  # 戻り値: 行と列の情報を配列に格納して返却する => [1, 1]
  def gets_piece_location(board_state)
    board = copy_board(board_state)
    game = MiniMaxGameManager.new(board: board, starting_order: @piece)

    minimax(game, 0)

    @best_locations
  end

  private

  # 概要: minimaxアルゴリズムを実行する
  # 引数: game: MiniMax専用のGameManagerクラスのオブジェクト
  #      depth: ゲーム木の深さ
  # 戻り値: 評価されたスコア
  def minimax(game, depth)
    return evaluate(game, depth) if !game.continue?

    depth += 1
    scores = []
    locations = []

    3.times do |row|
      3.times do |col|
        next if game.piece?(row, col)

        possible_game = copy_game(game)
        possible_game.set_piece_location(row, col)
        possible_game.player_turn
        possible_game.change_to_opponent_turn

        scores.push(minimax(
                      possible_game,
                      depth
                    ))
        locations.push([row, col])
      end
    end

    calc_best_score(game, scores, locations)
  end

  # 概要: 一番いいスコアを計算し、打ち手を保存する
  # 引数: game: MiniMax専用のGameManagerクラスのオブジェクト
  #      scores: スコアを格納している配列
  #      locations: 打ち場所を格納している配列
  # 戻り値: 評価数値
  def calc_best_score(game, scores, locations)
    if game.current_player_piece == @piece

      max = scores.max
      max_index = scores.index(max)
      @best_locations = locations[max_index]

      max
    else
      min = scores.min
      min_index = scores.index(min)
      @best_locations = locations[min_index]

      min
    end
  end

  # 概要: ゲームマネージャーをコピーする
  # 引数: game: ゲームマネージャクラスのオブジェクト
  # 戻り値: MiniMaxGameManagerクラスのオブジェクト
  def copy_game(game)
    board = copy_board(game.board_state)
    MiniMaxGameManager.new(board: board, starting_order: game.current_player_piece)
  end

  # 概要: ゲーム板をコピーする
  # 引数: board_state: ゲーム板の状態
  # 戻り値: Boardクラスオブジェクト
  def copy_board(board_state)
    Board.new(Marshal.load(Marshal.dump(board_state)))
  end

  # 概要: ゲーム木の深さと勝敗によって評価を実行する
  # 引数: game: MiniMax専用のGameManagerクラスのオブジェクト
  #      depth: ゲーム木の深さ
  # 戻り値: 評価数値
  def evaluate(game, depth)
    return 10 - depth if game.win? && game.current_player_piece == @piece
    return depth - 10 if game.opponent_win? && game.current_player_piece == @piece

    return depth - 10 if game.win? && game.current_player_piece != @piece
    return 10 - depth if game.opponent_win? && game.current_player_piece != @piece

    0
  end
end
