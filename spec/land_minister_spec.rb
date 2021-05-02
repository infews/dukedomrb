module Dukedom
  RSpec.describe LandMinister do
    let(:duke) { double("Fake Duke") }
    let(:random) { double("RandomNumberGenerator")}
    let(:ledger) { Ledger.new }
    let(:minister) { LandMinister.new(duke, ledger, random) }

    describe "#set_land_rate" do
      before do
        allow(random).to receive(:number_in).with(-1..1).and_return(-0.5)
      end

      context "when the calculated rate is less than 4" do
        it "sets to the minimum" do
          expect(minister.land_price).to eq(4)
        end
      end
      context "when the calculated rate is greater than 4" do
        before do
          ledger.crop_yield_rate = 8.2
          allow(random).to receive(:number_in).with(-1..1).and_return(1)
        end
        it "keeps the rate"  do
          expect(minister.land_price).to eq(12.4)
        end
      end
    end

    describe "#buy_land" do
      context "when the duke tries to buy too much land" do
        it "asks again for an appropriate amount" do
          allow(random).to receive(:number_in).with(-1..1).and_return(-0.5)
          expect(duke).to receive(:advice).with("Current land price is 4 hl/ha.")
          expect(duke).to receive(:advice).with("But you don't have enough grain to buy that much land.")
          expect(duke).to receive(:ask_positive_number).with("How much land would you like to buy?").and_return(1100, 200)
          expect(ledger).to receive(:buy_land).with(200, 4)

          minister.how_much_land_to_buy
        end
      end

      context "when the duke tries to buy an affordable amount of land" do
        it "tells the ledger we bought land" do
          allow(random).to receive(:number_in).with(-1..1).and_return(-0.5)
          expect(duke).to receive(:advice).with("Current land price is 4 hl/ha.")
          expect(duke).to receive(:ask_positive_number).with("How much land would you like to buy?").and_return(200)
          expect(ledger).to receive(:buy_land).with(200, 4)

          minister.how_much_land_to_buy
        end
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
