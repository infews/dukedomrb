module Dukedom
  RSpec.describe LandMinister do
    let(:duke) { double("Fake Duke") }
    let(:ledger) { Ledger.new }
    let(:minister) { LandMinister.new(duke, ledger) }

    # ### Buy Land
    # - Calculates rate of land for transaction
    # - Max of 4, Math.Floor(2 * crop_yield_rate + rand(-1,1) - 5)
    #   - Ask how much to buy at that rate?
    #   - reject if not enough grain to buy and try again
    #   - save land to buy

    describe "#set_land_rate" do
      context "when the calculated rate is less than 4" do
        it "sets to 4"
      end
      context "when the calculated rate is greater than 4" do
        it "keeps the rate"
      end
    end

    describe "#buy_land" do
      it "advises the duke on the current cost for new land"
      it "asks the duke for how much land to buy"

      context "when the duke tries to buy too much land" do
        it "asks again for an appropriate amount"
      end

      context "when the duke tries to buy an affordable amount of land" do
        it "buys and updates the ledger"
        it "buys and subtracts the expected amount of grain"
      end
    end

    describe "#sell_land" do
      it "tells the duke the available sale price"
      context "when duke attempts to sell more land than they have" do
        it "advises the duke and tries again"
        it "drops the sale price"
      end
      context "when duke attempts to sell more than the market allows" do
        it "advises the duke and tries again"
        it "drops the sale price"
      end
      context "when the duke sells the right amount of land" do
        it "sells the land and updates the ledger"
        it "sells and adds the expected amount of grain"
      end
      context "only attempts three sales cycles" do
        it "advises the duke that the market has lost interest"
      end
    end
  end
end
