# frozen_string_literal: true

# 乱数生成クラス
class Randomizer
  class << self
    # 概要: ランダムに0~2の数値を生成する
    # 引数: なし
    # 戻り値: 0 or 1 0r 2
    def create
      [0, 1, 2].sample
    end
  end
end
