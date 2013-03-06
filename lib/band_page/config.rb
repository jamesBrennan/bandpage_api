# Config object which exists primarily to document the
# information needed to interact with the BandPage API
module BandPage
  class Config
    attr_accessor :app_id, :client_id, :secret_key, :band_id

    def initialize(conf)
      @app_id = conf[:app_id]
      @client_id = conf[:client_id]
      @secret_key = conf[:secret_key]
      @band_id = conf[:band_id]
    end
  end
end