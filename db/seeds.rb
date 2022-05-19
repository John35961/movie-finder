require "json"
require "open-uri"

Movie.destroy_all

URL = 'https://tmdb.lewagon.com/movie/popular'.freeze
IMAGE_BASE_URL = 'https://image.tmdb.org/t/p/original'.freeze

response = JSON.parse(URI.open(URL).read)

response['results'].each do |movie|
  Movie.create({ title: movie['original_title'],
                 overview: movie['overview'],
                 poster_url: "#{IMAGE_BASE_URL}#{movie['backdrop_path']}",
                 rating: movie['vote_average']
  })
end
