module Dukedom
  RSpec.describe Ledger do
    let(:ledger) { Ledger.new }

    context "at start" do
      it "the year is zero" do
        expect(ledger.year).to eq(0)
      end

      it "there are the right number of peasants" do
        expect(ledger.peasants).to eq(100)
      end

      it "there is the right amount of land" do
        expect(ledger.land).to eq(600)
      end

      it "the land is allocated to the right fields"

      it "there is the right amount of grain" do
        expect(ledger.grain).to eq(4177)
      end

      it "there is a crop yield rate" do
        expect(ledger.crop_yield_rate).to eq(3.95)
      end
    end

    describe "events" do
      context "for peasants" do
        it "tracks starvations" do
          expect(ledger.starvations).to eq(0)
          ledger.starvations = 50
          expect(ledger.starvations).to eq(50)
        end

        it "tracks the king's levy" do
          expect(ledger.levy).to eq(0)
          ledger.levy = 10
          expect(ledger.levy).to eq(10)
        end

        it "tracks the war casualties" do
          expect(ledger.war_casualties).to eq(0)
          ledger.war_casualties = 10
          expect(ledger.war_casualties).to eq(10)
        end

        it "tracks the looting victims" do
          expect(ledger.looting_victims).to eq(0)
          ledger.looting_victims = 10
          expect(ledger.looting_victims).to eq(10)
        end

        it "tracks the disease victims" do
          expect(ledger.disease_victims).to eq(0)
          ledger.disease_victims = 10
          expect(ledger.disease_victims).to eq(10)
        end

        it "tracks the natural deaths" do
          expect(ledger.natural_deaths).to eq(0)
          ledger.natural_deaths = 10
          expect(ledger.natural_deaths).to eq(10)
        end

        it "tracks the births" do
          expect(ledger.births).to eq(0)
          ledger.births = 10
          expect(ledger.births).to eq(10)
        end
      end

      context "for land" do
        it "tracks land bought and sold" do
          expect(ledger.land_transactions).to eq(0)
          ledger.buy_land(15, 4)
          expect(ledger.land_transactions).to eq(15)
          ledger.sell_land(5)
          expect(ledger.land_transactions).to eq(10)
        end

        it "tracks fruits of war" do
          expect(ledger.seized_land).to eq(0)
          ledger.seized_land = 15
          expect(ledger.seized_land).to eq(15)
        end

        it "tracks the crop yield rate" do
          expect(ledger.crop_yield_rate).to eq(3.95)
          ledger.crop_yield_rate = 15
          expect(ledger.crop_yield_rate).to eq(15)
        end

        describe "#buy_land" do
          it "saves the land transactions" do
            ledger.buy_land(200, 4)

            expect(ledger.land_transactions).to eq(200)
            expect(ledger.grain_for_land).to eq(800)
          end

          it "saves the amount of grain for the land transactions"
        end

        describe "#sell_land" do
          it "sells land from the 60% field, then the 80% field, then the 100% field"
          it "adjusts the total land properly"
        end
      end

      context "for grain" do
        it "tracks the grain used for food" do
          expect(ledger.grain_for_food).to eq(0)
          ledger.grain_for_food = 23
          expect(ledger.grain_for_food).to eq(23)
        end

        it "tracks the grain spent for land deals" do
          expect(ledger.grain_for_land).to eq(0)
          ledger.grain_for_land = 571
          expect(ledger.grain_for_land).to eq(571)
        end

        it "tracks the seeding" do
          expect(ledger.seeding).to eq(0)
          ledger.seeding = 439
          expect(ledger.seeding).to eq(439)
        end

        it "tracks rat losses" do
          expect(ledger.rat_losses).to eq(0)
          ledger.rat_losses = 5
          expect(ledger.rat_losses).to eq(5)
        end

        it "tracks the grain spent on mercenaries" do
          expect(ledger.grain_for_mercs).to eq(0)
          ledger.grain_for_mercs = 100
          expect(ledger.grain_for_mercs).to eq(100)
        end

        it "tracks the fruits of war" do
          expect(ledger.seized_grain).to eq(0)
          ledger.seized_grain = 15
          expect(ledger.seized_grain).to eq(15)
        end

        it "tracks the crop yield" do
          expect(ledger.crop_yield).to eq(0)
          ledger.crop_yield = 150
          expect(ledger.crop_yield).to eq(150)
        end

        it "tracks the castle expenses" do
          expect(ledger.castle_expenses).to eq(0)
          ledger.castle_expenses = 50
          expect(ledger.castle_expenses).to eq(50)
        end

        it "tracks the royal tax" do
          expect(ledger.royal_tax).to eq(0)
          ledger.royal_tax = 30
          expect(ledger.royal_tax).to eq(30)
        end
      end
    end

    describe "#update_for_new_year" do
      before do
        ledger.starvations = 1
        ledger.levy = 1
        ledger.war_casualties = 1
        ledger.looting_victims = 1
        ledger.disease_victims = 1
        ledger.natural_deaths = 1
        ledger.births = 1

        ledger.buy_land(2,4)
        ledger.sell_land(3)
        ledger.seized_land = 10

        ledger.grain_for_food = 5
        ledger.grain_for_land = 5
        ledger.seeding = 5
        ledger.rat_losses = 5
        ledger.grain_for_mercs = 5
        ledger.seized_grain = 3
        ledger.crop_yield = 3
        ledger.castle_expenses = 5
        ledger.royal_tax = 5

        ledger.update_for_new_year
      end

      context "peasants" do
        it "updates the year" do
          expect(ledger.year).to eq(1)
        end

        it "updates the current peasant count" do
          expect(ledger.peasants).to eq(95)
        end

        it "saves the previous year's peasant count" do
          expect(ledger.previous_year_peasants).to eq(100)
        end

        it "clears the events" do
          expect(ledger.starvations).to eq(0)
          expect(ledger.levy).to eq(0)
          expect(ledger.war_casualties).to eq(0)
          expect(ledger.looting_victims).to eq(0)
          expect(ledger.disease_victims).to eq(0)
          expect(ledger.natural_deaths).to eq(0)
          expect(ledger.births).to eq(0)
        end
      end

      context "land" do
        it "updates the current land amount" do
          expect(ledger.land).to eq(609)
        end

        it "saves the previous year's land count" do
          expect(ledger.previous_year_land).to eq(600)
        end

        it "clears the events" do
          expect(ledger.land_transactions).to eq(0)
          expect(ledger.seized_land).to eq(0)
        end
      end

      context "grain" do
        it "updates the grain amount" do
          expect(ledger.grain).to eq(4148)
        end

        it "saves the previous year's grain amount" do
          expect(ledger.previous_year_grain).to eq(4177)
        end

        it "clears the events" do
          expect(ledger.grain_for_food).to eq(0)
          expect(ledger.grain_for_land).to eq(0)
          expect(ledger.seeding).to eq(0)
          expect(ledger.rat_losses).to eq(0)
          expect(ledger.grain_for_mercs).to eq(0)
          expect(ledger.seized_grain).to eq(0)
          expect(ledger.crop_yield).to eq(0)
          expect(ledger.castle_expenses).to eq(0)
          expect(ledger.royal_tax).to eq(0)
        end
      end
    end
  end
end
