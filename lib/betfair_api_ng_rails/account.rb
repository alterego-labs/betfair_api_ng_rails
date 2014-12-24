module BetfairApiNgRails
  class Account < Struct.new(:username, :password, :app_key, :crt_filepath, :key_filepath)
  end
end
