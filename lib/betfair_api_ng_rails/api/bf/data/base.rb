module BetfairApiNgRails
  module Api
    module BF
      module Data
        class Base

          def initialize(args = {})
            args.each { |attribute, value| self.send("#{attribute}=", value) }
          end

        end
      end
    end
  end
end