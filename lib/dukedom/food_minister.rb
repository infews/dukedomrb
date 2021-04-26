module Dukedom
  class FoodMinister
    FOOD_PER_PEASANT_MIN = 13

    def initialize(duke, ledger)
      @duke = duke
      @ledger = ledger
    end

    def how_much_grain_for_food
      food = starvations = 0
      done_asking = false

      until done_asking
        food = @duke.ask_positive_number("How much grain for food?")

        if food > @ledger.grain
          @duke.advice("But you don't have enough grain to feed the peasants that much.")
        elsif (food / @ledger.peasants).floor < 11 && food != @ledger.grain
          @duke.advice("The peasants demonstrate before the castle with sharpened scythes.")
        else
          done_asking = true
        end
      end

      # Peasants need 13HL of grain to survive, else some will starve
      if (food / @ledger.peasants) < FOOD_PER_PEASANT_MIN
        @duke.advice("Some peasants have starved.")
        starvations = (@ledger.peasants - (food / FOOD_PER_PEASANT_MIN)).floor
      end

      @ledger.grain_for_food = food
      @ledger.starvations = starvations
    end
  end
end
