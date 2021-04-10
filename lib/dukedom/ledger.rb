module Dukedom
  class Ledger
    attr_accessor :year, :peasants, :land, :grain,
      :starvations, :levy, :war_casualties, :looting_victims, :disease_victims,
      :natural_deaths, :births, :seized_land, :grain_for_food,
      :grain_for_land, :seeding, :rat_losses, :grain_for_mercs, :seized_grain, :crop_yield,
      :castle_expenses, :royal_tax

    attr_reader :previous_year_peasants, :previous_year_land, :land_transactions, :previous_year_grain

    def initialize
      @year = 0
      @peasants = 100
      @land = 600
      @grain = 4177

      reset_annual_events
    end

    def update_for_new_year
      @year += 1

      @previous_year_peasants = peasants
      @peasants -= (starvations + levy + war_casualties + looting_victims + disease_victims + natural_deaths)
      @peasants += births

      @previous_year_land = land
      @land += land_transactions + seized_land

      @previous_year_grain = grain
      @grain -= (grain_for_food + grain_for_land + seeding + rat_losses + grain_for_mercs + castle_expenses + royal_tax)
      @grain += (seized_grain + crop_yield)

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

# Sub InitializeGlobalTextStringArrays
# ' Initialize Text String Arrays
#   '
# GStr[1]  = "Grain at Start       "
# GStr[2]  = "Used for food        "
# GStr[3]  = "Land deals           "
# GStr[4]  = "Seeding              "
# GStr[5]  = "Rat losses           "
# GStr[6]  = "Mercenary hire       "
# GStr[7]  = "Fruits of war        "
# GStr[8]  = "Crop yield           "
# GStr[9]  = "Castle expense       "
# GStr[10] = "Royal tax            "
#
# LStr[1]  = "Land at Start        "
# LStr[2]  = "Bought/sold          "
# LStr[3]  = "Fruits of war        "
#
# PStr[1]  = "Peasants at Start    "
# PStr[2]  = "Starvations          "
# PStr[3]  = "King's levy          "
# PStr[4]  = "War casualties       "
# PStr[5]  = "Looting victims      "
# PStr[6]  = "Disease victims      "
# PStr[7]  = "Natural deaths       "
# PStr[8]  = "Births               "
