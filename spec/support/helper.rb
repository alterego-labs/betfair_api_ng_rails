class Helper
  class << self
    def key_to_attribute(key)
      key.to_s.gsub(/^([a-z])/) { $1.capitalize }.scan(/[A-Z][a-z]*/).join("_").downcase
    end
  end
end
