module BetfairApiNgRails
  module Api
    class BaseFormatter

      def format(record: {})
        raise 'Must be reimplemented!'
      end

    end
  end
end