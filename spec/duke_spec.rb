module Dukedom
  RSpec.describe Duke do
    let(:fake_io) { double("Fake StdIn") }
    let(:duke) { Duke.new(fake_io) }

    describe "#ask_positive_number" do
      context "when asking" do
        it "shows the prompt" do
          expect(fake_io).to receive(:print).with("how many candies? ")
          expect(fake_io).to receive(:gets).and_return("1")

          duke.ask_positive_number("how many candies?")
        end
      end
      context "when getting answers" do
        context "when the answer is a positive number" do
          it "returns the value" do
            expect(fake_io).to receive(:print).with("how many? ")
            expect(fake_io).to receive(:gets).and_return("5")

            answer = duke.ask_positive_number("how many?")
            expect(answer).to eq(5)
          end
        end
        context "when the answer is a not a number" do
          it "re-prompts until there is a number" do
            expect(fake_io).to receive(:print).exactly(3).times.with("how many? ")
            expect(fake_io).to receive(:gets).and_return("foo", "-5", "17")
            expect(fake_io).to receive(:puts).twice.with("Please respond with a positive number.")

            answer = duke.ask_positive_number("how many?")
            expect(answer).to eq(17)
          end
        end
      end
    end

    describe "#ask_yes_or_no" do
      context "when asking" do
        it "shows the prompt" do
          allow(fake_io).to receive(:print).with("hello (yes/no)? ")
          allow(fake_io).to receive(:gets).and_return("yes")

          duke.ask_yes_or_no("hello")
        end
      end

      context "when getting answers" do
        context "when the answer is yes" do
          it "returns the value" do
            allow(fake_io).to receive(:print).exactly(5).times.with("hello (yes/no)? ")
            allow(fake_io).to receive(:gets).and_return("yes", "YES", "y", "Yes", "Y")

            answer = duke.ask_yes_or_no("hello")
            expect(answer).to eq(:yes)

            answer = duke.ask_yes_or_no("hello")
            expect(answer).to eq(:yes)

            answer = duke.ask_yes_or_no("hello")
            expect(answer).to eq(:yes)

            answer = duke.ask_yes_or_no("hello")
            expect(answer).to eq(:yes)

            answer = duke.ask_yes_or_no("hello")
            expect(answer).to eq(:yes)
          end
        end

        context "when the answer is no" do
          it "returns the value" do
            allow(fake_io).to receive(:print).exactly(5).times.with("hello (yes/no)? ")
            allow(fake_io).to receive(:gets).and_return("no", "NO", "n", "No", "N")

            answer = duke.ask_yes_or_no("hello")
            expect(answer).to eq(:no)

            answer = duke.ask_yes_or_no("hello")
            expect(answer).to eq(:no)

            answer = duke.ask_yes_or_no("hello")
            expect(answer).to eq(:no)

            answer = duke.ask_yes_or_no("hello")
            expect(answer).to eq(:no)

            answer = duke.ask_yes_or_no("hello")
            expect(answer).to eq(:no)
          end
        end

        context "when the answer is not yes or no" do
          it "re-prompts until yes or no is returned" do
            allow(fake_io).to receive(:print).exactly(2).times.with("hello (yes/no)? ")
            allow(fake_io).to receive(:gets).and_return("FOO", "yes")
            allow(fake_io).to receive(:puts).with("Please respond yes or no.").and_return(nil)

            answer = duke.ask_yes_or_no("hello")
            expect(answer).to eq(:yes)
          end
        end
      end
    end

    describe "#advice" do
      it "reports information to the duke" do
        expect(fake_io).to receive(:puts).with(/some random advice/)

        duke.advice("some random advice")
      end
    end
  end
end
