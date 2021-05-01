module Dukedom
  RSpec.describe Fields do
    let(:amounts) { [10, 9, 8, 7, 6, 5] }
    let(:fields) { Fields.new(amounts) }

    describe "#at_100" do
      it "sets" do
        fields.at_100 = 75
        expect(fields.at_100).to eq(75)
      end

      it "gets" do
        expect(fields.at_100).to eq(10)
      end
    end

    describe "#at_80" do
      it "sets" do
        fields.at_80 = 75
        expect(fields.at_80).to eq(75)
      end

      it "gets" do
        expect(fields.at_80).to eq(9)
      end
    end

    describe "#at_60" do
      it "sets" do
        fields.at_60 = 75
        expect(fields.at_60).to eq(75)
      end
      it "gets" do
        expect(fields.at_60).to eq(8)
      end
    end

    describe "#at_40" do
      it "sets" do
        fields.at_40 = 75
        expect(fields.at_40).to eq(75)
      end
      it "gets" do
        expect(fields.at_40).to eq(7)
      end
    end

    describe "#at_20" do
      it "sets" do
        fields.at_20 = 75
        expect(fields.at_20).to eq(75)
      end
      it "gets" do
        expect(fields.at_20).to eq(6)
      end
    end

    describe "#at_0" do
      it "sets" do
        fields.at_0 = 75
        expect(fields.at_0).to eq(75)
      end

      it "gets" do
        expect(fields.at_0).to eq(5)
      end
    end

    describe "#total" do
      it "sums all of the field qualities" do
        expect(fields.total).to eq(45)
      end
    end

    describe "#available_to_sell" do
      it "reports the sum 100/80/60 field totals" do
        expect(fields.available_to_sell).to eq(27)
      end
    end

    describe "#plant" do
      it "updates the field quality amounts based on how much is planted"
    end

    describe "#harvest" do
      context "when there are seven year locusts" do
        it "returns the crop yield rate"
      end
      context "when there are note seven year locusts" do
        it "returns the crop yield rate"
      end
    end
  end
end
