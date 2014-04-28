module BetfairApiNgRails
  module Api
    module Logs
      class ConsoleLogger
        
        def write(content)
          puts content
        end

      end
    end
  end
end