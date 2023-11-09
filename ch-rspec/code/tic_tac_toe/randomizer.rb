# frozen_string_literal: true

# 乱数生成クラス
class Randomizer
  class << self
    def create
      [0, 1, 2].sample
    end
  end
end
