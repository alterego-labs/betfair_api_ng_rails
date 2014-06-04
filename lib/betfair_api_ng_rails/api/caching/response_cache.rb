require 'ostruct'
require 'json'

module BetfairApiNgRails
  module Api
    module Caching
      class ResponseCache
        include Api::Caching::Helper
        include Api::Caching::Models
        
        attr_reader :method, :sig_params

        def initialize(method, params)
          @method = method
          @sig_params = createsig(params)
        end

        def is_cached?
          cache_result.count > 0
        end

        def responser
          Api::Http::Responser.new prepare_response
        end

        def cache!(response)
          BetfairCache.create(create_params(response)).expire expire_time
        end

      private

        def cache_result
          BetfairCache.where(method: method, params: sig_params)
        end

        def prepare_response
          OpenStruct.new body: cache_result.first.response, code: '200'
        end

        def expire_time
          BetfairApiNgRails.config.cache_expire
        end

        def create_params(response)
          { method: method, params: sig_params, response: JSON.dump(response) }
        end

      end
    end
  end
end