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

    def header
      text = ""
      text << "Population Report".cyan
      text << "\n"
      text <<  "---------------------".cyan
      text << "\n"
      text
    end
    def template
      text = <<~ERB
        <%= header %>
        Peasants at start of year <%= @ledger.previous_year_peasants %>
        King's Levy               <%= @ledger.levy %>
        Disease Victims           <%= @ledger.disease_victims %>
        Natural Deaths            <%= @ledger.natural_deaths %>
        Births                    <%= @ledger.births %>

      ERB
    end
  end
end
