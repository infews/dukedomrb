module Dukedom
  RSpec.describe MajorDomo do
    let(:duke) do
      d = double(Duke)
      allow(d).to receive(:advice)
      d
    end
    let(:ledger) { Ledger.new }
    let(:majordomo) { MajorDomo.new(ledger, duke) }

    describe "#update_resentment_due_to_food" do
      before do
        majordomo.update_resentment_due_to_food
      end
      it "calculates resentment" do
        expect(majordomo.resentment).to eq(28)
      end
    end

    describe "#game_over?" do
      context "when there are enough peasants" do
        it "the game is not over" do
          expect(majordomo.game_over?).to eq(false)
        end
      end

      context "when there too few peasants" do
        before do
          ledger.peasants = 32
        end
        it "the game is over" do
          expect(majordomo.game_over?).to eq(true)
        end

        it "tells the duke why the game is over" do
          expect(duke).to receive(:advice).with(/deposed/)
          majordomo.game_over?
        end
      end

      context "when resentment is low" do
        it "the game is not over" do
          expect(majordomo.game_over?).to eq(false)
        end
      end

      context "when resentment is high" do
        before do
          majordomo.resentment = 89
        end
        it "the game is over" do
          expect(majordomo.game_over?).to eq(true)
        end

        it "tells the duke why the game is over" do
          expect(duke).to receive(:advice).with(/deposed/)
          majordomo.game_over?
        end
      end

      context "when there is enough land" do
        it "the game is not over" do
          expect(majordomo.game_over?).to eq(false)
        end
      end

      context "when there is not enough land" do
        before do
          ledger.fields.at_100 = 199
          ledger.fields.at_80 = 0
          ledger.fields.at_60 = 0
          ledger.fields.at_40 = 0
          ledger.fields.at_20 = 0
          ledger.fields.at_0 = 0
        end
        it "the game is over" do
          expect(majordomo.game_over?).to eq(true)
        end

        it "tells the duke why the game is over" do
          expect(duke).to receive(:advice).with(/deposed/)
          majordomo.game_over?
        end
      end

      context "when the duke is not ready to retire" do
        it "the game is not over" do
          expect(majordomo.game_over?).to eq(false)
        end
      end

      context "when the duke is old enough to retire" do
        before do
          ledger.year = 46
        end

        context "and the king is neutral" do
          it "the game is over" do
            expect(majordomo.game_over?).to eq(true)
          end
          it "tells the duke why the game is over" do
            expect(duke).to receive(:advice).with(/retirement/)
            majordomo.game_over?
          end
        end

        context "and the king is not neutral" do
          before do
            majordomo.king_sentiment = 2
          end
          it "the game is not over" do
            expect(majordomo.game_over?).to eq(false)
          end
        end
      end
    end
  end
end
