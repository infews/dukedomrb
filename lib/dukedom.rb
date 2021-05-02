# frozen_string_literal: true

require_relative "dukedom/version"
require_relative "dukedom/base_table"
require_relative "dukedom/ledger"
require_relative "dukedom/summary_reporter"
require_relative "dukedom/detail_reporter"
require_relative "dukedom/duke"
require_relative "dukedom/major_domo"
require_relative "dukedom/food_minister"
require_relative "dukedom/fields"
require_relative 'dukedom/land_minister'

module Dukedom
  class Error < StandardError; end

  class Game
    class << self
      def play
        game_over = false

        duke = Duke.new
        ledger = Ledger.new
        majordomo = MajorDomo.new(ledger, duke)
        food_minister = FoodMinister.new(duke, ledger)
        land_minister = LandMinister.new(duke, ledger)

        summary_reporter = SummaryReporter.new(ledger)
        detail_reporter = DetailReporter.new(ledger)

        puts "Welcome to the new Duke."
        puts

        until game_over
          break if majordomo.game_over?

          puts summary_reporter.report
          puts
          puts detail_reporter.report

          food_minister.how_much_grain_for_food
          majordomo.update_resentment_due_to_food

          # 8. Update Ledger / End check
          # 9. Make a LandMinister
          # 10. Update Ledger / End check
          # 10.5 => War with king? WarMinister
          # 11. Make a FarmingMinister
          # 12. Update Ledger
          # 14. Process Disease Stuff
          # 15. Increment Year
          # 16. Retirement check
          # end

          # 18. Why did we break?
          puts "Press <enter> when ready for next year"
          gets
          system "clear"
          ledger.update_for_new_year
        end

        game_over
      end
    end
  end
end
