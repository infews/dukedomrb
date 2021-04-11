module Dukedom
  RSpec.describe DetailReporter do
    let(:ledger) { Ledger.new }
    let(:reporter) { DetailReporter.new(ledger) }

    describe "report" do
      let(:report) { reporter.report }
      let(:lines) { report.split("\n") }

      context "for the peasants section" do
        it "has a header" do
          expect(lines[0]).to match(/Population Report/)
          expect(lines[1]).to match(/(-)+/)
          expect(lines[2]).to eq("")
        end

        it "lists last years peasants" do
          expect(lines[3]).to match(/^Peasants at start of year/)
          expect(lines[3]).to match(/100$/)
        end

        it "lists the king's levy" do
          expect(lines[4]).to match(/^King's Levy/)
          expect(lines[4]).to match(/\d+/)
        end

        it "lists disease deaths" do
          expect(lines[5]).to match(/^Disease Victims/)
          expect(lines[5]).to match(/\d+/)
        end
        it "lists natural deaths" do
          expect(lines[6]).to match(/^Natural Deaths/)
          expect(lines[6]).to match(/\d+/)
        end
        it "lists births" do
          expect(lines[7]).to match(/^Births/)
          expect(lines[7]).to match(/\d+/)
        end
      end

      context "for the land section" do
        it "lists the current crop yield rate" do
          expect(lines[12]).to match(/^Crop Yield Rate/)
          expect(lines[12]).to match(/\s+\d+\.\d+\s+/)
          expect(lines[12]).to match(/HL\/HA$/)
        end

        it "lists the land at start" do
          expect(lines[13]).to match(/^Land at start of year/)
          expect(lines[13]).to match(/\s+\d+/)
        end

        it "lists the land bought and sold" do
          expect(lines[14]).to match(/^Bought and sold/)
          expect(lines[14]).to match(/\s+\d+/)
        end
      end

      context "for the grain section" do
      end
    end
  end
end
