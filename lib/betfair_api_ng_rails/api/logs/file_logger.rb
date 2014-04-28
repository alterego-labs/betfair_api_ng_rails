module BetfairApiNgRails
  module Api
    module Logs
      class FileLogger
        
        attr_reader :root, :env

        def initialize(root, env)
          @root, @env = root, env
        end

        def write(content)
          File.open(file_path, 'w') { |file| file.write(content) }
        end

      private

        def file_path
          @_log_file_path ||= "#{root}/log/betfair_api_ng_rails.#{env}.log"
        end

      end
    end
  end
end