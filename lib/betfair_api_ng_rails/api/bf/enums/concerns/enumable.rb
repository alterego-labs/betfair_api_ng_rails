module BetfairApiNgRails
  module Api
    module BF
      module Data
        module Concerns
          module Enumable

            def enumify(*args)
              args.flatten.each { |const|  const_set(const, const)  }
            end

          end
        end
      end
    end
  end
end