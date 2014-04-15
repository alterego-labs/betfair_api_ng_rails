require 'betfair_api_ng_rails/api/concerns/errorable'

module BetfairApiNgRails
  module Api
    class SessionManager
      class << self
        include Apieq(false)::Concerns::Errorable
        include Apieq(false)::Constants

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

      private

        def fetch_ssoid
          process_response(get_login_response).tap { |sid| send_keep_alive(sid) }
        end

        def process_response(response)
          response['sessionToken']
        end

        def get_login_response
          http_requester.do_request.result
        end

        def send_keep_alive(sid)
          return unless Apieq(false)::Config.keep_alive_session
          keep_alive_requester(sid).do_request
        end

        def http_requester
          @_http_requester ||= Apieq(false)::Http::Factory.session_requester
        end

        def keep_alive_requester(sid)
          Apieq(false)::Http::Factory.keep_alive_requester sid
        end

      end
    end
  end
end