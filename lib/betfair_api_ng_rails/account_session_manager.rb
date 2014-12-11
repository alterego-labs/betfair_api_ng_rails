require 'singleton'

module BetfairApiNgRails
  class AccountSessionManager
    include Singleton

    attr_reader :sessions

    def initialize
      clear
    end

    def store(session)
      sessions[session.username] = session
    end

    def get(username)
      sessions.fetch(username, AccountSession.new).ssoid
    end

    def expire(username)
      sessions.delete username
    end

    def clear
      @sessions = {}
    end
  end
end
