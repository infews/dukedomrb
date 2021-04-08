module Dukedom
  class BaseTable
    attr_reader :ra_1, :ra_2, :ra_3, :ra_4, :ra_5, :ra_6, :ra_7, :ra_8

    def initialize
      reset
    end

    def reset
      @ra_1 = rand(4..7)
      @ra_2 = rand(4..8)
      @ra_3 = rand(4..6)
      @ra_4 = rand(3..8)
      @ra_5 = rand(3..8)
      @ra_6 = rand(3..6)
      @ra_7 = rand(3..8)
      @ra_8 = rand(4..8)
    end
  end
end
