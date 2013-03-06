require "bandpage/version"
require "bandpage/config"
require "bandpage/token"
require "bandpage/client"

module Bandpage
  class AuthorizationError < StandardError; end
  class ResourceNotFoundError < StandardError; end
  class ServerError < StandardError; end
  class ServiceUnavailableError < StandardError; end
end