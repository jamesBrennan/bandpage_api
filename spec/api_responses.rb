module Bandpage
  module RecordedApiResponses
    def self.tracks
      "HTTP/1.1 200 OK\r\nContent-Type: application/json;charset=UTF-8\r\nDate: Tue, 05 Mar 2013 23:06:07 GMT\r\nLink: <https://api-read.bandpage.com/164527841654870016/tracks?offset=50&access_token=AAAAAQAAAAECluDXQ8JgAAKW4NcngmAAApbgKZSCMAAAAAAAAAAAAAAAAT09BFezUoRLKkkXgLrchDm6DOYYA0tY5K0=>;rel=\"next\";type=\"application/json\";title=\"Next Results\"\r\nServer: Apache-Coyote/1.1\r\nContent-Length: 2241\r\nConnection: keep-alive\r\n\r\n[{\"albumArt\":{\"original\":{\"source\":\"https://i1.sndcdn.com/artworks-000037081241-3xfo2g-large.jpg?923db0b\",\"width\":0,\"height\":0},\"large\":{\"source\":\"https://i1.sndcdn.com/artworks-000037081241-3xfo2g-large.jpg?923db0b\",\"width\":0,\"height\":0},\"small\":{\"source\":\"https://i1.sndcdn.com/artworks-000037081241-3xfo2g-large.jpg?923db0b\",\"width\":0,\"height\":0},\"thumb\":{\"source\":\"https://i1.sndcdn.com/artworks-000037081241-3xfo2g-large.jpg?923db0b\",\"width\":0,\"height\":0}},\"artworkUrl\":\"\",\"bid\":\"164528215925219328\",\"downloadCount\":\"0\",\"downloadUrl\":\"\",\"downloadable\":false,\"duration\":\"149617\",\"permalinkUrl\":\"http://soundcloud.com/james-the-giant/long-days-of-longing\",\"playCount\":\"97\",\"provider\":\"soundcloud\",\"providerId\":\"72769600\",\"purchasable\":false,\"purchaseUrl\":\"\",\"streamUrl\":\"http://api.soundcloud.com/tracks/72769600/stream?secret_token=s-JiJNd&consumer_key=P0OieYzyPHtoHulKAJOjlA\",\"title\":\"Long Days of Longing\",\"type\":\"Track\"},{\"albumArt\":{\"original\":{\"source\":\"\",\"width\":0,\"height\":0},\"large\":{\"source\":\"\",\"width\":0,\"height\":0},\"small\":{\"source\":\"\",\"width\":0,\"height\":0},\"thumb\":{\"source\":\"\",\"width\":0,\"height\":0}},\"artworkUrl\":\"\",\"bid\":\"164528200733437952\",\"downloadCount\":\"0\",\"downloadUrl\":\"\",\"downloadable\":false,\"duration\":\"185982\",\"permalinkUrl\":\"http://soundcloud.com/james-the-giant/wave-hello-wave-goodbye\",\"playCount\":\"79\",\"provider\":\"soundcloud\",\"providerId\":\"72770796\",\"purchasable\":false,\"purchaseUrl\":\"\",\"streamUrl\":\"http://api.soundcloud.com/tracks/72770796/stream?secret_token=s-Z07gg&consumer_key=P0OieYzyPHtoHulKAJOjlA\",\"title\":\"Wave Hello, Wave Goodbye\",\"type\":\"Track\"},{\"albumArt\":{\"original\":{\"source\":\"\",\"width\":0,\"height\":0},\"large\":{\"source\":\"\",\"width\":0,\"height\":0},\"small\":{\"source\":\"\",\"width\":0,\"height\":0},\"thumb\":{\"source\":\"\",\"width\":0,\"height\":0}},\"artworkUrl\":\"\",\"bid\":\"165717578767949824\",\"downloadCount\":\"0\",\"downloadUrl\":\"\",\"downloadable\":false,\"duration\":\"181462\",\"permalinkUrl\":\"http://soundcloud.com/james-the-giant/seven-secret-words\",\"playCount\":\"52\",\"provider\":\"soundcloud\",\"providerId\":\"73134819\",\"purchasable\":false,\"purchaseUrl\":\"\",\"streamUrl\":\"http://api.soundcloud.com/tracks/73134819/stream?secret_token=s-njzbu&consumer_key=P0OieYzyPHtoHulKAJOjlA\",\"title\":\"Seven Secret Words\",\"type\":\"Track\"}]"
    end

    def self.authenticate
      "HTTP/1.1 200 OK\r\nContent-Type: application/json;charset=UTF-8\r\nDate: Wed, 06 Mar 2013 00:18:51 GMT\r\nServer: Apache-Coyote/1.1\r\nContent-Length: 151\r\nConnection: keep-alive\r\n\r\n{\"access_token\":\"AAAAAQAAAAECluDXQ8JgAAKW4NcngmAAApbgKZSCMAAAAAAAAAAAAAAAAT09R4rH6yW52T8rDPD3C__Hnl-O6Bw5MtM=\",\"token_type\":\"bearer\",\"expires_in\":3600}"
    end

    def self.server_error
      "HTTP/1.1 500 Internal Server Error\r\nContent-Type: application/json;charset=ISO-8859-1\r\nDate: Wed, 06 Mar 2013 01:05:13 GMT\r\nServer: Apache-Coyote/1.1\r\nContent-Length: 241\r\nConnection: keep-alive\r\n\r\n{\"error\":\"Failed to convert value of type 'java.lang.String' to required type 'com.rootmusic.core.domain.RmidBackedObject'; nested exception is java.lang.NumberFormatException: A rmid needs to be of type Long. Recived 164527841654870016456\"}"
    end

    def self.service_unavailable
      "HTTP/1.1 503 Service Unavailable\r\nDate: Wed, 06 Mar 2013 01:09:50 GMT\r\nServer: Apache-Coyote/1.1\r\nContent-Length: 0\r\nConnection: keep-alive\r\n\r\n"
    end

    def self.not_found
      "HTTP/1.1 404 Not Found\r\nDate: Wed, 06 Mar 2013 01:09:50 GMT\r\nServer: Apache-Coyote/1.1\r\nContent-Length: 0\r\nConnection: keep-alive\r\n\r\n"
    end
  end
end