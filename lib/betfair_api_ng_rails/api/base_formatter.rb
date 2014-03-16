module BetfairApiNgRails
  module Api
    class BaseFormatter

      def format(record: {}, resource: "")
        raise 'Must be reimplemented!'
      end

    end
  end
end