def welcome
  puts "Welcome!"
end

def get_character_from_user
  puts "please enter a character"
  return gets.chomp.downcase
end
