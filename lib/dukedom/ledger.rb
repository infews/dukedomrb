module Dukedom
  class Ledger
    attr_accessor :year, :peasants, :land, :grain,
      :starvations, :levy, :war_casualties, :looting_victims, :disease_victims,
      :natural_deaths, :births, :seized_land, :grain_for_food,
      :grain_for_land, :seeding, :rat_losses, :grain_for_mercs, :seized_grain, :crop_yield,
      :castle_expenses, :royal_tax

    attr_reader :previous_year_peasants, :previous_year_land, :land_transactions, :previous_year_grain, :crop_yield_rate

    def initialize
      @year = 0
      @peasants = @previous_year_peasants = 100
      @land = @previous_year_land = 600
      @grain = @previous_year_grain = 4177
      @crop_yield_rate = 3.95

      reset_annual_events
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
    end

    def sell_land(existing_land)
      @land_transactions -= existing_land
    end

    def game_over?
      if @peasants < 33
        true
      else
        @land < 200
      end
    end

    private

    def settle_population
      @previous_year_peasants = peasants
      @peasants -= (starvations + levy + war_casualties + looting_victims + disease_victims + natural_deaths)
      @peasants += births
    end

    def settle_land
      @previous_year_land = land
      @land += land_transactions + seized_land
    end

    def settle_grain
      @previous_year_grain = grain
      @grain -= (grain_for_food + grain_for_land + seeding + rat_losses + grain_for_mercs + castle_expenses + royal_tax)
      @grain += (seized_grain + crop_yield)
    end

    def reset_annual_events
      @starvations = @levy = @war_casualties = @looting_victims = 0
      @disease_victims = @natural_deaths = @births = 0

      @land_transactions = @seized_land = 0

      @grain_for_food = @grain_for_land = @seeding = 0
      @rat_losses = @grain_for_mercs = @seized_grain = 0
      @crop_yield = @castle_expenses = @royal_tax = 0
    end
  end
end
