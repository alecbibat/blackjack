#generate deck of 52 unique cards
#shuffle deck
#deal 2 cards to both player and dealer, pop from deck
#player hits or stays
#dealer hits if total under 16, otherwise stays
#there are clubs, diamonds, hearts, spades

decks = {"Player Deck" => {}, "Dealer Deck" => {}}

deck = ["1C", "2C", "3C", "4C", "5C", "6C", "7C", "8C", "9C", "10C", "JC", "QC", "KC", "AC"]

player_hand = {1 => ' ', 2 => ' '}

deck_data = {"1c" => 1, "2c" => 2}

fields = [:name, :suit, :value, :usage]

def deal(deck)
	puts "picking random item..."
	gets.chomp()
	rand = rand(0..13)
	puts "******************"
	puts "FIRST CARD : #{deck[rand]}" #deck[rand]
	puts "******************"
	deck = deck - ["#{deck[rand]}"]
	puts deck
	rand_2 = rand(0..12)
	puts "******************"
	puts "SECOND CARD : #{deck[rand]}" #deck[rand]
	puts "******************"
	deck = deck - ["#{deck[rand]}"]
	puts deck
	puts "******************"
end

puts "starting..."
gets.chomp()
puts "******************"
deal(deck)