module Dukedom
  class LandMinister
    def initialize(duke, ledger, random = RandomNumberGenerator.new)
      @duke = duke
      @ledger = ledger
      @random = random
    end

    def land_price
      price = (2 * @ledger.crop_yield_rate + @random.number_in(-1.0..1.0) - 5).round(2)
      [4, price].max
    end

    def how_much_land_to_buy
      @duke.advice("Current land price is #{land_price} hl/ha.")

      land_to_buy = 0
      done_asking = false

      until done_asking
        land_to_buy = @duke.ask_positive_number("How much land would you like to buy?")

        if (land_to_buy * land_price) > @ledger.grain
          @duke.advice("But you don't have enough grain to buy that much land.")
          next
        end

        done_asking = true
        @ledger.buy_land(land_to_buy, land_price)
      end
    end
  end

  class RandomNumberGenerator
    def number_in(range)
      rand(range)
    end
  end
end
