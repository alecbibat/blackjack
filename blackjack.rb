#generate deck of 52 unique cards
#shuffle deck
#deal 2 cards to both player and dealer, pop from deck
#player hits or stays
#dealer hits if total under 16, otherwise stays
#a deck consists of clubs, diamonds, spades, and hearts

deck = ["2C", "3C", "4C", "5C", "6C", "7C", "8C", "9C", "10C", "JC", "QC", "KC", "AC"]

card_values = {"2C" => 2, "3C" => 3, "4C" => 4, "5C" => 5, "6C" => 6, "7C" => 7, "8C" => 8, "9C" => 9, "10C" => 10, "JC" => 10, "QC" => 10, "KC" => 10, "AC" => 11}

fields = [:name, :suit, :value, :usage]

def deal(deck, card_values)
	puts "picking random item..."
	gets.chomp()
	rand = rand(0..12)
	card_1 = deck[rand]
	puts "******************"
	puts "FIRST CARD : #{deck[rand]}" #deck[rand]
	puts "******************"
	deck = deck - ["#{deck[rand]}"]
	puts deck


	rand_2 = rand(0..11)
	card_2 = deck[rand_2]
	puts "******************"
	puts "SECOND CARD : #{deck[rand_2]}" #deck[rand]
	puts "******************"
	deck = deck - ["#{deck[rand_2]}"]
	puts deck
	puts "******************"
	evaluate_hand(deck, card_1, card_2, card_values)
end

def evaluate_hand(deck, card_1, card_2, card_values)
	puts card_1
	puts card_2
	hand_value = card_values[card_1] + card_values[card_2]
	puts "The value of your hand is #{hand_value}"
	hit_or_stay(deck, hand_value)
end

def hit_or_stay(deck, hand_value)
	puts "Input 1 to hit"
	puts "Input 2 to stay"
	print ">"
	hit_stay = gets.chomp.to_i
	if hit_stay == 1
		puts "You chose to hit."
	elsif hit_stay == 2
		puts "You chose to stay."
	else
		puts "I don't know what that means."
		hit_or_stay(deck, hand_value)
	end
end

def hit(deck, hand_value)
end

def stay(deck, hand_value)
end

puts "starting..."
gets.chomp()
puts "******************"
deal(deck, card_values)