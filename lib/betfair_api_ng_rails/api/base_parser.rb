require 'json'

module Api
  class BaseParser

    def parse(response: "")
      raise "Must be reimplemented!"
    end

  private

    def jsonify(response)
      JSON.parse response
    rescue
      {}
    end

  end
end