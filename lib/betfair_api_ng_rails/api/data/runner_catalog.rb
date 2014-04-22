module BetfairApiNgRails
  module Api
    module Data
      class RunnerCatalog < Api::Data::Base

        RUNNER_CATALOG_ATTRS = [
          :selection_id,
          :runner_name,
          :handicap,
          :sort_priority,
          :metadata
        ]

        attributes RUNNER_CATALOG_ATTRS

      end
    end
  end
end