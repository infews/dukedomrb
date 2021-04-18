module Dukedom
  class FoodMinister
    def how_much_grain_for_food(duke, grain, peasants)
      food = starvations = 0
      done_asking = false

      until done_asking
        food = duke.ask_positive_number("How much grain for food?")

        if food > grain
          duke.advice("But you don't have enough grain to feed the peasants that much.")
        elsif (food / peasants).floor < 11 && food != grain
          duke.advice("The peasants demonstrate before the castle with sharpened scythes.")
        else
          done_asking = true
        end
      end

      if (food / peasants) < 13
        duke.advice("Some peasants have starved.")
        starvations = (peasants - (food / 13)).floor
      end

      [food, starvations]
    end
  end
end
