# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Card.destroy_all
Deck.destroy_all
puts "creating deck"
Deck.create!(shuffled:false, cards_count: 0)
puts 'deck created'

puts 'creating cards'
value_array = ['ACE', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'JACK', 'QUEEN', 'KING']
suit_array = ['HEARTS', 'CLUBS', 'SPADES', 'DIAMONDS']

i = 0
13.times do
  Card.create!(suit:suit_array[0], value: value_array[i], deck_id: Deck.first.id)
  Card.create!(suit:suit_array[1], value: value_array[i], deck_id: Deck.first.id)
  Card.create!(suit:suit_array[2], value: value_array[i], deck_id: Deck.first.id)
  Card.create!(suit:suit_array[3], value: value_array[i], deck_id: Deck.first.id)
  i += 1
end

puts 'cards created'
