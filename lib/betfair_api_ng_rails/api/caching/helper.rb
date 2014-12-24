module BetfairApiNgRails
  module Api
    module Caching
      module Helper
        def createsig(body)
          Digest::MD5.hexdigest sigflat(body)
        end

        def sigflat(body)
          res = nil
          if body.class == Hash
            arr = []
            body.each do |key, value|
              arr << "#{sigflat key}=>#{sigflat value}"
            end
            res = arr
          end
          if body.class == Array
            str = ''
            res = body.map do |value|
              sigflat value
            end.sort!.each do |value|
              str << value
            end
          end
          if body.class != String
            res = body.to_s << body.class.to_s
          end
          res || body
        end
      end
    end
  end
end
