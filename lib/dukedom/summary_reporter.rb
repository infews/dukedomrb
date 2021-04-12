require "erb"
require "rainbow/refinement"
using Rainbow

module Dukedom
  class SummaryReporter
    def initialize(ledger)
      @ledger = ledger
    end

    def report
      ERB.new(template).result(binding)
    end

    def header
      text = "Annual Report Summary".underline.cyan
      text << "\n"
      text
    end

    def template
      <<~ERB
        <%= header %>
        Year       <%= @ledger.year %>
        Peasants   <%= @ledger.peasants %>
        Land       <%= @ledger.land %> hectares (ha)
        Grain      <%= @ledger.grain %> hectoliters (hl)
      ERB
    end
  end
end
