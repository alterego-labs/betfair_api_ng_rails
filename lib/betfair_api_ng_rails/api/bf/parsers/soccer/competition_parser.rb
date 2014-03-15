module BetfairApiNgRails
  module Api
    module BF
      module Parsers
        module Soccer
          class CompetitionParser < Api::BaseParser

          private

            def process_record(h)
              h.merge! h['competition']
              h.except! 'competition'
              h
            end

          end
        end
      end
    end
  end
end