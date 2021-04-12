module Dukedom
  class Duke
    def initialize(input_output = InputOutput.new)
      @input_output = input_output
    end

    def ask_yes_or_no(prompt)
      yes_no = :no_input
      until [:yes, :no].include?(yes_no)
        input = @input_output.gets("#{prompt} (yes/no)?").chomp
        yes_no = if ["yes", "YES", "y", "Yes", "Y"].include?(input)
          :yes
        elsif ["no", "NO", "n", "No", "N"].include?(input)
          :no
        else
          @input_output.puts "Please respond yes or no."
        end
      end
      yes_no
    end

    def ask_positive_number(prompt)
      number = -1
      until number >= 0
        input = @input_output.gets(prompt.to_s).chomp
        if /\d+/.match?(input) && input.to_i >= 0
          number = input.to_i
        else
          @input_output.puts "Please respond with a positive number."
        end
      end
      number
    end
  end

  class InputOutput
    def gets(str)
      Kernel.gets(str)
    end

    def puts(str)
      Kernel.puts(str)
    end
  end
end
