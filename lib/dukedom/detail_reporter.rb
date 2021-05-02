require "erb"
require "rainbow/refinement"
using Rainbow

module Dukedom
  class DetailReporter
    def initialize(ledger)
      @ledger = ledger
    end

    def report
      ERB.new(template).result(binding)
    end

    def header(name)
      text = "#{name} Report".underline.yellow
      text << "\n"
      text
    end

    # TODO: Move to a file, make a presenter that holds the rjust text in a presenter class?
    def template
      <<~ERB
        <%= header("Population") %>
        Peasants at start of year <%= @ledger.previous_year_peasants %>
        King's Levy               <%= @ledger.levy %>
        Disease Victims           <%= @ledger.disease_victims %>
        Natural Deaths            <%= @ledger.natural_deaths %>
        Births                    <%= @ledger.births %>
        
        <%= header("Land") %>
        Crop Yield Rate           <%= @ledger.crop_yield_rate %> HL/HA
        Land at start of year     <%= @ledger.previous_year_land %>
        Bought and sold           <%= @ledger.land_transactions %>
        
        <%= header("Field Quality") %>
        100%  <%= @ledger.fields.at_100 %>    
         80%  <%= @ledger.fields.at_80 %>  
         60%  <%= @ledger.fields.at_60 %>
         40%  <%= @ledger.fields.at_40 %>  
         20%  <%= @ledger.fields.at_20 %> 
          0%  <%= @ledger.fields.at_0 %>                      

        <%= header("Grain") %>
        Grain at start of year    <%= @ledger.previous_year_grain %>
        Used for food             <%= @ledger.grain_for_food      %>
        Used for land deals       <%= @ledger.grain_for_land      %>
        Seedings                  <%= @ledger.seeding             %>
        Rat losses                <%= @ledger.rat_losses          %>
        Crop yield                <%= @ledger.crop_yield          %>
        Castle expenses           <%= @ledger.castle_expenses     %>
        Royal Tax                 <%= @ledger.royal_tax           %>
        
      ERB
    end
  end
end
