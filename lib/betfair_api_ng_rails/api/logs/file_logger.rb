module BetfairApiNgRails
  module Api
    module Logs
      class FileLogger < Struct.new(:root, :env)
        def write(content)
          File.open(file_path, 'a') do |file|
            file.puts "[#{now_date}] - #{content}"
          end
        end

        private

        def now_date
          DateTime.now.strftime '%Y-%m-%d %H:%M:%S.%L'
        end

        def file_path
          @_log_file_path ||= "#{root}/log/betfair_api_ng_rails.#{env}.log"
        end
      end
    end
  end
end
