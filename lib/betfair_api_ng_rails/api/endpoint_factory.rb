require 'active_support/core_ext/object'

module BetfairApiNgRails
  module Api
    class EndpointFactory
      class << self
        def call(name)
          name.is_a?(Symbol) ? init_by_name(name) : name.try(:new)
        end

        private

        def init_by_name(name)
          "BetfairApiNgRails::Api::Endpoints::#{name.to_s.camelize}".constantize.new
        rescue NameError
          raise Api::InvalidEndpointError, "Could not found endpoint `#{name}`!"
        end
      end
    end
  end
end
