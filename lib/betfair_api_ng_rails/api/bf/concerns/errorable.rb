require 'active_support/core_ext/object'

module Api
  module BF
    module Concerns
      module Errorable

        def has_errors?
          !error_info.nil?
        end

        def error_info
          @http_responser.try(:error_info?)
        end

      end
    end
  end
end