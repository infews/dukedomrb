module Dukedom
  class MajorDomo
    attr_accessor :king_sentiment, :resentment

    def initialize(ledger, duke)
      @ledger = ledger
      @duke = duke
      @king_sentiment = 0
      @resentment = 0
    end

    def update_resentment_due_to_food
      overfed = [4, (@ledger.grain_for_food / @ledger.peasants).floor - 14].min
      @resentment += (3 * @ledger.starvations) - (2 * overfed)
    end

    def game_over?
      if @ledger.peasants <= 32
        @duke.advice("You have been deposed due to low population.")
        true
      elsif @ledger.land <= 199
        @duke.advice("You have been deposed due to low land holdings.")
        true
      elsif @ledger.year > 45 && @king_sentiment == 0
        @duke.advice("You have reached the year of retirement.")
        true
      elsif @resentment > 88
        @duke.advice("You have been deposed due to the people's resentment.")
        true
      else
        false
      end
    end
  end
end
