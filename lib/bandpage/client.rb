require 'httparty'
require 'recursive-open-struct'

module Bandpage
  class Client
    CONNECTIONS = [:emails, :events, :genres, :tracks, :photos, :videos, :websites]
    BASE_URL = 'https://api-read.bandpage.com/'

    attr_accessor :config, :token
    def initialize(config)
      @config = config
    end

    def band
      get
    end

    def method_missing(m, *args, &block)
      return get(m) if CONNECTIONS.include?(m)
      super
    end

    def load_response_objects(response)
      response.parsed_response.map do |obj|
        RecursiveOpenStruct.new(obj)
      end
    end

    private

    def authenticate
      resp = HTTParty.post("#{BASE_URL}/token",
                               basic_auth: {
                                 username: config.client_id,
                                 password: config.secret_key
                               },
                               query: {
                                 client_id: config.client_id,
                                 grant_type: 'client_credentials'
                               })
      if [200, 202].include? resp.code
        @token = Bandpage::Token.new(resp['access_token'], resp['expires_in'])
      else
        error_response resp
      end
    end

    def get(connection = nil)
      authenticate if @token.nil? || @token.expired?
      resp = HTTParty.get(url(connection), headers:
        {"Authorization" => "Bearer #{@token.string}"}
      )
      if [200, 202].include? resp.code
        load_response_objects resp
      else
        error_response resp
      end
    end

    def error_response(resp)
      raise case resp.code
        when 401
          Bandpage::AuthorizationError
        when 404
          Bandpage::ResourceNotFoundError
        when 500
          Bandpage::ServerError.new resp['error']
        else
          StandardError.new("An unknown error occurred when attempting to parse: #{resp.inspect}")
      end
    end

    def url(connection)
      connection.nil? ? band_url : "#{band_url}/#{connection}adc"
    end

    def band_url
      @band_url ||= "#{BASE_URL}/#{bid}"
    end

    def bid
      config.band_id
    end
  end
end