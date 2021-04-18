module Dukedom
  class Duke
    def initialize(input_output = InputOutput.new)
      @input_output = input_output
    end

    def advice(info)
      @input_output.puts info
    end

    def ask_yes_or_no(prompt)
      yes_no = :no_input

      until [:yes, :no].include?(yes_no)
        @input_output.print("#{prompt} (yes/no)? ")
        input = @input_output.gets.chomp

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
      number = nil

      while number.nil?
        @input_output.print("#{prompt} ")
        input = @input_output.gets.chomp

        number = if /\d+/.match?(input) && input.to_i >= 0
          input.to_i
        else
          @input_output.puts "Please respond with a positive number."
        end
      end

      number
    end
  end

  class InputOutput
    def gets
      Kernel.gets
    end

    def puts(str)
      Kernel.puts(str)
    end

    def print(str)
      Kernel.print(str)
    end
  end
end
