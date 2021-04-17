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
          expect(lines[1]).to eq("")
        end

        it "lists last years peasants" do
          expect(lines[2]).to match(/^Peasants at start of year/)
          expect(lines[2]).to match(/100$/)
        end

        it "lists the king's levy" do
          expect(lines[3]).to match(/^King's Levy/)
          expect(lines[3]).to match(/\d+/)
        end

        it "lists disease deaths" do
          expect(lines[4]).to match(/^Disease Victims/)
          expect(lines[4]).to match(/\d+/)
        end
        it "lists natural deaths" do
          expect(lines[5]).to match(/^Natural Deaths/)
          expect(lines[5]).to match(/\d+/)
        end
        it "lists births" do
          expect(lines[6]).to match(/^Births/)
          expect(lines[6]).to match(/\d+/)
        end
      end

      context "for the land section" do
        it "lists the current crop yield rate" do
          expect(lines[10]).to match(/^Crop Yield Rate/)
          expect(lines[10]).to match(/\s+\d+\.\d+\s+/)
          expect(lines[10]).to match(/HL\/HA$/)
        end

        it "lists the land at start" do
          expect(lines[11]).to match(/^Land at start of year/)
          expect(lines[11]).to match(/\s+\d+/)
        end

        it "lists the land bought and sold" do
          expect(lines[12]).to match(/^Bought and sold/)
          expect(lines[12]).to match(/\s+\d+/)
        end
      end

      context "for the grain section" do
        before do
          ledger
        end

        it "lists the grain at the start of the year" do
          expect(lines[17]).to match(/^Grain at start of year/)
          expect(lines[17]).to match(/\s+\d+$/)
        end

        it "lists the grain used for food" do
          expect(lines[18]).to match(/^Used for food/)
          expect(lines[18]).to match(/\s+\d+$/)
        end

        it "lists the grain used for land deals" do
          expect(lines[19]).to match(/^Used for land deals/)
          expect(lines[19]).to match(/\s+\d+$/)
        end

        it "lists the seedings" do
          expect(lines[20]).to match(/^Seedings/)
          expect(lines[20]).to match(/\s+\d+$/)
        end

        it "lists the rat losses" do
          expect(lines[21]).to match(/^Rat losses/)
          expect(lines[21]).to match(/\s+\d+$/)
        end

        it "lists the crop yield" do
          expect(lines[22]).to match(/^Crop yield/)
          expect(lines[22]).to match(/\s+\d+$/)
        end
        it "lists the castle expenses" do
          expect(lines[23]).to match(/^Castle expenses/)
          expect(lines[23]).to match(/\s+\d+$/)
        end

        it "lists the royal tax" do
          expect(lines[24]).to match(/^Royal Tax/)
          expect(lines[24]).to match(/\s+\d+$/)
        end
      end
    end
  end
end
