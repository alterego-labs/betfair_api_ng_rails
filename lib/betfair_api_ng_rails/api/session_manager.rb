require 'betfair_api_ng_rails/api/concerns/errorable'

module BetfairApiNgRails
  module Api
    class SessionManager
      class << self
        include Api::Concerns::Errorable
        include Api::Constants

        def ssoid
          @ssoid ||= fetch_ssoid
        end

        def request_ssoid
          ssoid
          !has_errors?
        end

        def expire_ssoid
          @ssoid = nil
        end

        def new_ssoid
          expire_ssoid
          ssoid
        end

      private

        def fetch_ssoid
          get_login_response.session_token.tap { |sid| send_keep_alive(sid) }
        end

        def get_login_response
          http_requester.do_request
        end

        def send_keep_alive(sid)
          return unless Api::Config.keep_alive_session
          keep_alive_requester(sid).do_request
        end

        def http_requester
          @_http_requester ||= Api::Http::Factory.session_requester
        end

        def keep_alive_requester(sid)
          Api::Http::Factory.keep_alive_requester sid
        end

      end
    end
  end
end