module BetfairApiNgRails
  module Api
    module Data
      class RunnerCatalog < Api::Data::Base

        attr_accessor *RUNNER_CATALOG_ATTRS

        def self.from_json(json_row)
          new RUNNER_CATALOG_ATTRS.inject({}) { |h, a| h[a] = json_row[a.to_s.camelize(:lower)]; h }
        end

      end
    end
  end
end