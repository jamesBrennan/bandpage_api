module Bandpage
  class Token
    attr_accessor :expires_at, :string
    def initialize(string, expires_in)
      @string = string
      @expires_at = Time.now + expires_in.to_i
    end

    def expired?
      @expires_at < Time.now
    end
  end
end