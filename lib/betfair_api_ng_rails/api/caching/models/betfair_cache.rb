module BetfairApiNgRails
  module Api
    module Caching
      module Models
        class BetfairCache < ActiveRedis::Base

          attributes method:   :string,
                     params:   :string,
                     response: :string

        end     
      end
    end
  end
end