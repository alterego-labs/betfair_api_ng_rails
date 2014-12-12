require 'betfair_api_ng_rails/api/concerns/errorable'
require 'active_support/core_ext/module/delegation'

module BetfairApiNgRails
  module Api
    class SessionManager
      class << self
        include Api::Concerns::Errorable
        include Api::Constants

        def get_ssoid(account)
          username = account.username
          ssoid = BetfairApiNgRails.account_session_manager.get username
          ssoid || SsoidRequester.new(account).get
        end

        def expire_ssoid(account)
          username = account.username
          BetfairApiNgRails.account_session_manager.expire username
        end
      end

      class SsoidRequester < Struct.new(:account)
        delegate :username, to: :account

        def get
          session_token.tap do |token|
            store_session token
          end
        end

        private

        def store_session(token)
          BetfairApiNgRails.account_session_manager.store account_session(token)
        end

        def account_session(token)
          BetfairApiNgRails::AccountSession.new(username, token)
        end

        def session_token
          get_login_response.session_token
        end

        def get_login_response
          http_requester.do_request
        end

        def http_requester
          @_http_requester ||= Api::Http::Factory.session_requester
        end
      end
    end
  end
end
