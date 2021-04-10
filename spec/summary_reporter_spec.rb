module Dukedom
  RSpec.describe SummaryReporter do
    let(:ledger) { Ledger.new }
    let(:reporter) { SummaryReporter.new(ledger) }

    describe "report" do
      let(:report) { reporter.report }
      let(:lines) { report.split("\n") }

      it "lists the year" do
        expect(lines[3]).to match(/^Year/)
        expect(lines[3]).to match(/\d+$/)
      end

      it "lists the number of peasants" do
        expect(lines[4]).to match(/^Peasants/)
        expect(lines[4]).to match(/\d+$/)
      end

      it "lists the amount of land" do
        expect(lines[5]).to match(/^Land/)
        expect(lines[5]).to match(/\d+/)
        expect(lines[5]).to match(/hectares/)
      end

      it "lists the amount of grain" do
        expect(lines[6]).to match(/^Grain/)
        expect(lines[6]).to match(/\d+/)
        expect(lines[6]).to match(/hectoliters/)
      end
    end
  end
end
