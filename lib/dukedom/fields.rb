module Dukedom
  class Fields
    # The fields are broken into six levels of quality.
    # The data is stored as an array of 6 values for making it easy to plant and rotate crops.
    # Array is stored in descending rate of quality

    def initialize(amounts)
      @fields = amounts.clone
    end

    def at_100=(value)
      @fields[0] = value
    end

    def at_100
      @fields[0]
    end

    def at_80=(value)
      @fields[1] = value
    end

    def at_80
      @fields[1]
    end

    def at_60=(value)
      @fields[2] = value
    end

    def at_60
      @fields[2]
    end

    def at_40=(value)
      @fields[3] = value
    end

    def at_40
      @fields[3]
    end

    def at_20=(value)
      @fields[4] = value
    end

    def at_20
      @fields[4]
    end

    def at_0=(value)
      @fields[5] = value
    end

    def at_0
      @fields[5]
    end

    def total
      @fields.sum
    end

    def available_to_sell
      @fields[0..2].sum
    end

    def report
      "#{@fields[0]}, #{@fields[1]}, #{@fields[2]}, #{@fields[3]}, #{@fields[4]}, #{@fields[5]}"
    end
  end
end
