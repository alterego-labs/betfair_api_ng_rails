module BetfairApiNgRails
  module Api
    module Data
      class AccountDetailsResponse < Api::Data::Base
        include Api::Data::Concerns::Hashable

        ACCOUNT_DETAILS_RESPONSE_ATTRS = [
          :currency_code,
          :first_name,
          :last_name,
          :locale_code,
          :region,
          :timezone,
          :discount_rate,
          :points_balance
        ]

        attributes ACCOUNT_DETAILS_RESPONSE_ATTRS

        def self.to_hash_attrs
          ACCOUNT_DETAILS_RESPONSE_ATTRS
        end
      end
    end
  end
end

