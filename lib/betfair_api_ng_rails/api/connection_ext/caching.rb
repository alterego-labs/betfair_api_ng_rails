require 'active_support/inflector'

module BetfairApiNgRails
  module Api
    module ConnectionExt
      module Caching
        include BetfairApiNgRails::Api::Constants

        def self.included(base)
          base.send :class_eval,  <<-CODE
            def request_with_caching(method, params = {})
              if is_caching_on?
                process_with_caching method, params
              else
                return request_without_caching(method, params)
              end
            end
            alias_method :request_without_caching, :request
            alias_method :request, :request_with_caching
          CODE
        end

      private

        def is_caching_on?
          BetfairApiNgRails.config.use_cache
        end

        def process_with_caching(method, params)
          cache_service = Api::Caching::ResponseCache.new(method, params)
          if cache_service.is_cached?
            return cache_service.responser
          else
            return make_real_request(method, params, cache_service)
          end
        end

        def make_real_request(method, params, cache_service)
          res = request_without_caching(method, params)
          cache_service.cache!(res.result) if need_caching?(res)
          res
        end

        def need_caching?(res)
          !(res.nil? || res.has_error?)
        end

      end
    end
  end
end