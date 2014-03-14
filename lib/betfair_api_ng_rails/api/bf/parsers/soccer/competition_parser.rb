module BetfairApiNgRails
  module Api
    module BF
      module Parsers
        module Soccer
          class CompetitionParser < Api::BaseParser

            def parse(response: {})
              response['result'].map { |r| process_competition(r) }
            end

          private

            def process_competition(h)
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