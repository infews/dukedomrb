module Dukedom
  class Ledger
    attr_accessor :year, :peasants, :grain,
      :starvations, :levy, :war_casualties, :looting_victims, :disease_victims,
      :natural_deaths, :births, :seized_land, :grain_for_food,
      :grain_for_land, :seeding, :rat_losses, :grain_for_mercs, :seized_grain, :crop_yield,
      :castle_expenses, :royal_tax

    attr_reader :fields, :previous_year_peasants, :previous_year_land, :land_transactions, :previous_year_grain, :crop_yield_rate

    def initialize
      @year = 0
      @peasants = @previous_year_peasants = 100
      @grain = @previous_year_grain = 4177
      @fields = Fields.new([600, 0, 0, 0, 0, 0])
      @previous_year_land = @fields.total

      @crop_yield_rate = 3.95 # TODO: this will need to be updated by AgricultureMinister, so attr_accessor

      reset_annual_events
    end

    def land
      @fields.total
    end

    def update_for_new_year
      @year += 1

      settle_population
      settle_land
      settle_grain

      reset_annual_events
    end

    def buy_land(additional_land)
      @land_transactions += additional_land
      # TODO: bought land always starts at 60
    end

    def sell_land(existing_land)
      @land_transactions -= existing_land
      # TODO: Sell 60, then 80, then 100 land
    end

    private

    def settle_population
      @previous_year_peasants = peasants
      @peasants -= (starvations + levy + war_casualties + looting_victims + disease_victims + natural_deaths)
      @peasants += births
    end

    def settle_land
      @previous_year_land = @fields.total
      @fields.at_60 += land_transactions + seized_land
    end

    def settle_grain
      @previous_year_grain = grain
      @grain -= (grain_for_food + grain_for_land + seeding + rat_losses + grain_for_mercs + castle_expenses + royal_tax)
      @grain += (seized_grain + crop_yield)
    end

    def reset_annual_events
      @starvations =
        @levy =
          @war_casualties =
            @looting_victims =
              @disease_victims =
                @natural_deaths =
                  @births =
                    @land_transactions =
                      @seized_land =
                        @grain_for_food =
                          @grain_for_land =
                            @seeding =
                              @rat_losses =
                                @grain_for_mercs =
                                  @seized_grain =
                                    @crop_yield =
                                      @castle_expenses =
                                        @royal_tax = 0
    end
  end
end
