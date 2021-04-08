module Dukedom
  RSpec.describe BaseTable do
    let(:base_table) { BaseTable.new }

    context "has base data" do
      it "with RA_1 in the correct range" do
        expect(base_table.ra_1).to satisfy { |v| v >= 4 && v <= 7 }
      end

      it "with RA_2 in the correct range" do
        expect(base_table.ra_2).to satisfy { |v| v >= 4 && v <= 7 }
      end

      it "with RA_3 in the correct range" do
        expect(base_table.ra_3).to satisfy { |v| v >= 4 && v <= 6 }
      end

      it "with RA_4 in the correct range" do
        expect(base_table.ra_4).to satisfy { |v| v >= 3 && v <= 8 }
      end

      it "with RA_5 in the correct range" do
        expect(base_table.ra_5).to satisfy { |v| v >= 3 && v <= 8 }
      end

      it "with RA_6 in the correct range" do
        expect(base_table.ra_6).to satisfy { |v| v >= 3 && v <= 6 }
      end

      it "with RA_7 in the correct range" do
        expect(base_table.ra_7).to satisfy { |v| v >= 3 && v <= 8 }
      end

      it "with RA_8 in the correct range" do
        expect(base_table.ra_8).to satisfy { |v| v >= 4 && v <= 8 }
      end
    end

    context "when reset" do
      before do
        base_table.reset
      end
      it "with RA_1 in the correct range" do
        expect(base_table.ra_1).to satisfy { |v| v >= 4 && v <= 7 }
      end

      it "with RA_2 in the correct range" do
        expect(base_table.ra_2).to satisfy { |v| v >= 4 && v <= 7 }
      end

      it "with RA_3 in the correct range" do
        expect(base_table.ra_3).to satisfy { |v| v >= 4 && v <= 6 }
      end

      it "with RA_4 in the correct range" do
        expect(base_table.ra_4).to satisfy { |v| v >= 3 && v <= 8 }
      end

      it "with RA_5 in the correct range" do
        expect(base_table.ra_5).to satisfy { |v| v >= 3 && v <= 8 }
      end

      it "with RA_6 in the correct range" do
        expect(base_table.ra_6).to satisfy { |v| v >= 3 && v <= 6 }
      end

      it "with RA_7 in the correct range" do
        expect(base_table.ra_7).to satisfy { |v| v >= 3 && v <= 8 }
      end

      it "with RA_8 in the correct range" do
        expect(base_table.ra_8).to satisfy { |v| v >= 4 && v <= 8 }
      end
    end
  end
end
