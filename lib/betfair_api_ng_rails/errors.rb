module BetfairApiNgRails
  class NoConnectionError < ::StandardError
  end

  class APINGException < ::StandardError
    attr_reader :info
    def initialize(info)
      @info = info
    end
  end

  class NoAccountProvided < ::StandardError
  end
end
