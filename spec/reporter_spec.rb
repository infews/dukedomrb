module Dukedom
  RSpec.describe Reporter do
    let(:ledger) { Ledger.new }
    let(:reporter) { Reporter.new(ledger) }

    describe "report" do
      let(:report) { reporter.report }
      let(:lines) { report.split("\n") }

      it "lists the year" do
        expect(lines[0]).to match(/^Year/)
        expect(lines[0]).to match(/\d+$/)
      end

      it "lists the number of peasants" do
        expect(lines[1]).to match(/^Peasants/)
        expect(lines[1]).to match(/\d+$/)
      end

      it "lists the amount of land" do
        expect(lines[2]).to match(/^Land/)
        expect(lines[2]).to match(/\d+$/)
      end

      it "lists the amount of grain" do
        expect(lines[3]).to match(/^Grain/)
        expect(lines[3]).to match(/\d+$/)
      end
    end
  end
end
