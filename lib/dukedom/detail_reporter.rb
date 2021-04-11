require "erb"
require 'rainbow/refinement'
using Rainbow

module Dukedom
  class DetailReporter
    def initialize(ledger)
      @ledger = ledger
    end

    def report
      ERB.new(template).result(binding)
    end

    def population_header
      text = ""
      text << "Population Report".cyan
      text << "\n"
      text << "-----------------".cyan
      text << "\n"
      text
    end

    def land_header
      text = ""
      text << "Land Report".cyan
      text << "\n"
      text << "-----------".cyan
      text << "\n"
      text
    end

    def template
      text = <<~ERB
        <%= population_header %>
        Peasants at start of year <%= @ledger.previous_year_peasants %>
        King's Levy               <%= @ledger.levy %>
        Disease Victims           <%= @ledger.disease_victims %>
        Natural Deaths            <%= @ledger.natural_deaths %>
        Births                    <%= @ledger.births %>

        <%= land_header %>
        Crop Yield Rate           <%= @ledger.crop_yield_rate %> HL/HA
        Land at start of year     <%= @ledger.previous_year_land %>
        Bought and sold           <%= @ledger.land_transactions %>
      ERB
    end
  end
end
