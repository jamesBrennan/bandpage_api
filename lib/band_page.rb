require "band_page/version"
require "band_page/config"
require "band_page/token"
require "band_page/client"

module BandPage
  class AuthorizationError < StandardError; end
  class ResourceNotFoundError < StandardError; end
  class ServerError < StandardError; end
  class ServiceUnavailableError < StandardError; end
end