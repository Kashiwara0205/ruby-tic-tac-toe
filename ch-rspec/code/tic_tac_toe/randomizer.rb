# frozen_string_literal: true

# Randomにindexを生成する
class Randomizer
  class << self
    def create_random_index
      [0, 1, 2].sample
    end
  end
end
