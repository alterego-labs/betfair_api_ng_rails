module BetfairApiNgRails
  module Api
    module Data
      class AccountFundsResponse < Api::Data::Base
        include Api::Data::Concerns::Hashable

        ACCOUNT_FUNDS_RESPONSE_ATTRS = [
          :available_to_bet_balance,
          :exposure,
          :retained_comission,
          :exposure_limit,
          :discount_rate,
          :points_balance
        ]

        attributes ACCOUNT_FUNDS_RESPONSE_ATTRS

        def self.to_hash_attrs
          ACCOUNT_FUNDS_RESPONSE_ATTRS
        end
      end
    end
  end
end


