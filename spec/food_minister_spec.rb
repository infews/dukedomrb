module Dukedom
  RSpec.describe FoodMinister do
    let(:duke) { double("Fake Duke") }
    let(:minister) { FoodMinister.new }
    let(:grain) { 5000 }
    let(:peasants) { 100 }

    context "when the minister asks the duke for how much grain to use for food" do
      context "and the duke asks for too much grain for food" do
        it "complains and asks again" do
          expect(duke).to receive(:ask_positive_number).with("How much grain for food?").and_return(5001, 1500)
          expect(duke).to receive(:advice).with("But you don't have enough grain to feed the peasants that much.")

          minister.how_much_grain_for_food(duke, grain, peasants)
        end
      end

      context "and the duke asks for far too little grain for food" do
        it "complains and asks again" do
          expect(duke).to receive(:ask_positive_number).with("How much grain for food?").and_return(10, 1500)
          expect(duke).to receive(:advice).with("The peasants demonstrate before the castle with sharpened scythes.")

          minister.how_much_grain_for_food(duke, grain, peasants)
        end
        context "but assigns all remaining grain for food" do
          let(:grain) { 500 }

          it "continues" do
            expect(duke).to receive(:ask_positive_number).with("How much grain for food?").and_return(500)
            expect(duke).to receive(:advice).with(/Some peasants have starved/)

            minister.how_much_grain_for_food(duke, grain, peasants)
          end
        end
      end

      context "and the duke asks for almost enough food" do
        it "returns the amount of food and the number of starvations" do
          expect(duke).to receive(:ask_positive_number).with("How much grain for food?").and_return(1150)
          expect(duke).to receive(:advice).with(/Some peasants have starved/)

          food, starvations = minister.how_much_grain_for_food(duke, grain, peasants)

          expect(food).to eq(1150)
          expect(starvations).to eq(12)
        end
      end

      context "and the duke asks for enough food" do
        it "returns an approved amount of grain and no starvations" do
          expect(duke).to receive(:ask_positive_number).with("How much grain for food?").and_return(3500)

          food, starvations = minister.how_much_grain_for_food(duke, grain, peasants)

          expect(food).to eq(3500)
          expect(starvations).to eq(0)
        end
      end
    end
  end
end
