require "erb"

module Dukedom
  class Reporter
    def initialize(ledger)
      @ledger = ledger
    end

    def report
      ERB.new(template).result(binding)
    end

    def template
      text = <<~ERB
        Year                <%= @ledger.year %>
        Peasants            <%= @ledger.peasants %>
        Land (hectares)     <%= @ledger.land %>
        Grain (hectoliters) <%= @ledger.grain %>
      ERB
    end
  end
end
