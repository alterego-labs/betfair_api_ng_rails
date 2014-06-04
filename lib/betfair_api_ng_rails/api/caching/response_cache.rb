require 'ostruct'
require 'json'

module BetfairApiNgRails
  module Api
    module Caching
      class ResponseCache
        include Api::Caching::Helper
        
        attr_reader :method, :sig_params

        def initialize(method, params)
          @method = method
          @sig_params = createsig(params)
        end

        def self.redis_connection
          @_redis_connection ||= Redis.new
        end

        def is_cached?
          !cache_result.nil?
        end

        def responser
          Api::Http::Responser.new prepare_response
        end

        def cache!(response)
          cache_adapter.set cache_key, JSON.dump(response)
          cache_adapter.expire cache_key, expire_time
        end

      private

        def cache_result
          @_cache_result ||= cache_adapter.get cache_key
        end

        def prepare_response
          OpenStruct.new body: cache_result, code: '200'
        end

        def expire_time
          BetfairApiNgRails.config.cache_expire
        end

        def cache_adapter
          self.class.redis_connection
        end

        def cache_key
          "betfair_api_ng_rails:#{method}:#{sig_params}"
        end

      end
    end
  end
end