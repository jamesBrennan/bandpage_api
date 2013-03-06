# BandPage

A ruby wrapper for the BandPage API.

## Installation

Add this to your gemfile:
	
	gem 'band_page'


## Usage

Create a BandPage::Config object with your application keys

	config = BandPage::Config.new(
		app_id: '1234567890',
        client_id: '8b651906fb8cbe0ca7ecb38067ba8331',
        secret_key: '53138ae1ee8da7dc38a05254cae60c4d',
        band_id: '987654321234567'
    )
    
Create a new BandPage::Client with your config

	client = BandPage::Client.new(config)

The client can now be used to read information from BandPage. For example:

	tracks = client.tracks
	
The following methods are available on Client.:

	band, emails, events, genres, tracks, photos, videos, websites	
	
Except for __band__ all methods return an array of RecursiveOpenStructs which means that the properties can be accessed as if they were regular attributes, for example:

	titles = tracks.map do |track|
		track.title
	end
	
Specific properties of objects can be found on the [BandPage API docs](https://developers.bandpage.com/docs)
	
__band__ returns the [Graph Object](https://developers.bandpage.com/docs/using_the_bandpage_api/Making_Calls) which returns an array of arrays and hashes.

## Contributing

Contributions are welcome and encouraged. Please write specs for any changes that you would like merged. Thanks!

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
