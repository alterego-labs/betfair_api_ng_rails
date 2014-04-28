require 'colorize'

module BetfairApiNgRails
  module Api
    module Logs
      class ConsoleLogger
        
        def write(content)
          puts content.green
        end

      end
    end
  end
end