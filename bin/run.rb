#!/usr/bin/env ruby

require "pry"

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

test_array = []
character_list = populate_character_list

welcome
while test_array.empty?
	character = get_character_from_user
	test_array = show_character_movies(character_list, character)
	exit if !test_array.empty?
	puts "TRY AGAIN"
end

binding.pry

