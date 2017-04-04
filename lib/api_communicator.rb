require 'rest-client'
require 'json'
require 'pry'


def populate_character_list
  character_list = []
  i = 1
  while i < 10
    str = "http://www.swapi.co/api/people/?page=#{i}"
    character_list << get_API(str)["results"]
    i += 1
  end
  character_list.flatten
end



def get_character_movies_from_api(character_list, character)

  character_list.each do |char|
    if char["name"].downcase == character
      new_film_arr = []
      char["films"].each do |film|
        new_film_arr << get_API(film)
      end
      return new_film_arr
      else
    end
  end
  return []
end

def get_API(url)
  JSON.parse(RestClient.get(url))
end

def parse_character_movies(films_hash)
  test_array = []
  films_hash.each_with_index do |film, index|
    puts "#{index + 1}. #{film['title']}"
    test_array << film["title"]
  end
  test_array
end

def show_character_movies(character_list, character)
  films_hash = get_character_movies_from_api(character_list, character)
  parse_character_movies(films_hash)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?