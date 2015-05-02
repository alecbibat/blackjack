#generate deck of 52 unique cards
#shuffle deck
#deal 2 cards to both player and dealer, pop from deck
#player hits or stays
#dealer hits if total under 16, otherwise stays
#a deck consists of clubs, diamonds, spades, and hearts

deck = ["2C", "3C", "4C", "5C", "6C", "7C", "8C", "9C", "10C", "JC", "QC", "KC", "AC",
				"2H", "3H", "4H", "5H", "6H", "7H", "8H", "9H", "10H", "JH", "QH", "KH", "AH",
				"2D", "3D", "4D", "5D", "6D", "7D", "8D", "9D", "10D", "JD", "QD", "KD", "AD",
				"2S", "3S", "4S", "5S", "6S", "7S", "8S", "9S", "10S", "JS", "QS", "KS", "AS"]

card_values = {"2C" => 2, "3C" => 3, "4C" => 4, "5C" => 5, "6C" => 6, "7C" => 7, "8C" => 8, "9C" => 9, "10C" => 10, "JC" => 10, "QC" => 10, "KC" => 10, "AC" => 11,
							 "2H" => 2, "3H" => 3, "4H" => 4, "5H" => 5, "6H" => 6, "7H" => 7, "8H" => 8, "9H" => 9, "10H" => 10, "JH" => 10, "QH" => 10, "KH" => 10, "AH" => 11,
							 "2D" => 2, "3D" => 3, "4D" => 4, "5D" => 5, "6D" => 6, "7D" => 7, "8D" => 8, "9D" => 9, "10D" => 10, "JD" => 10, "QD" => 10, "KD" => 10, "AD" => 11,
							 "2S" => 2, "3S" => 3, "4S" => 4, "5S" => 5, "6S" => 6, "7S" => 7, "8S" => 8, "9S" => 9, "10S" => 10, "JS" => 10, "QS" => 10, "KS" => 10, "AS" => 11}

fields = [:name, :suit, :value, :usage]

#takes the array deck and chooses two random items
#then passes to evaluate_hand
#change the rands so the program counts the deck
#then does rand(0..deck.count - 1)
def deal(deck, card_values)
	puts "Hit enter to deal cards."
	gets.chomp()
	deck_count = deck.count - 1
	rand = rand(0..deck_count)
	card_1 = deck[rand]
	puts "******************"
	puts "FIRST CARD : #{deck[rand]}" #deck[rand]
	puts "******************"
	deck = deck - ["#{deck[rand]}"]

	deck_count = deck.count - 1
	rand_2 = rand(0..deck_count)
	card_2 = deck[rand_2]
	puts "******************"
	puts "SECOND CARD : #{deck[rand_2]}" #deck[rand]
	puts "******************"
	deck = deck - ["#{deck[rand_2]}"]
	puts "******************"

	deck_count = deck.count - 1
	rand_3 = rand(0..deck_count)
	d_card_1 = deck[rand_3]
	puts "******************"
	puts "DEALER'S FIRST CARD : #{deck[rand_3]}" #deck[rand]
	puts "******************"
	deck = deck - ["#{deck[rand_3]}"]

	deck_count = deck.count - 1
	rand_4 = rand(0..deck_count)
	d_card_2 = deck[rand_4]
	puts "******************"
	puts "DEALER'S SECOND CARD : ??" #deck[rand], don't show values to player
	puts "******************"
	deck = deck - ["#{deck[rand_4]}"]
	#puts deck
	#needs to deal two cards to the dealer here
	#can probably use the same methods as above
	#in the same function
	evaluate_hand(deck, card_1, card_2, card_values, d_card_1, d_card_2)
end

#calculates the values of the two cards from deal
#passes to hit or stay
def evaluate_hand(deck, card_1, card_2, card_values, d_card_1, d_card_2)
	hand_value = card_values[card_1] + card_values[card_2]
	puts "The value of your hand is #{hand_value}"
	

	d_hand_value = card_values[d_card_1] + card_values[d_card_2]
	puts "The dealer's hand value is ??"

	hit_or_stay(deck, hand_value, card_1, card_2, card_values, d_hand_value)
	#we can evaluate the dealer's hand here too\
	#involves passing another value to all the methods
	#d_hand_value
end

#first calculates if hand_value is greater than or equal to 21
#if it is, passes to game_over
#if it isn't, asks user to hit or stay
#passes to methods 'hit' or 'stay' respectively
def hit_or_stay(deck, hand_value, card_1, card_2, card_values, d_hand_value)
	#hits if the dealer has a hand value under 17
  if d_hand_value < 17
		deck_count = deck.count - 1
		rand_4 = rand(0..deck_count)
		d_card_next = deck[rand_4]
		puts "The dealer hits!"
		puts "******************"
		puts "DEALER'S NEXT CARD : #{deck[rand_4]}" #deck[rand]
		puts "******************"
		deck = deck - ["#{deck[rand_4]}"]
		d_hand_value = d_hand_value + card_values[d_card_next]
		puts "The dealer's new hand value is #{d_hand_value}!"
	#if dealer's hand value is over 17, dealer stays
  else
		puts "The dealer stays!"
	end

	##this code is useless
  #if d_hand_value >= 21
	#	game_over(hand_value, d_hand_value)
	#	exit
	#elsif d_hand_value == 21
	#	game_over(hand_value, d_hand_value)
	#	exit
	#else
	#end

	#if hand_value >= 21
	#	game_over(d_hand_value, hand_value)
	#	exit
	#elsif d_hand_value >=21
	#	game_over(d_hand_value, hand_value)
	#	exit
	#else
	#end

  gets.chomp()

	puts "Input 1 to hit"
	puts "Input 2 to stay"
	print ">"
	hit_stay = gets.chomp.to_i
	if hit_stay == 1
		hit(deck, hand_value, card_1, card_2, card_values, d_hand_value)
	elsif hit_stay == 2
		stay(deck, hand_value, card_1, card_2, card_values, d_hand_value)
	else
		puts "I don't know what that means."
		hit_or_stay(deck, hand_value, card_1, card_2, card_values, d_hand_value)
	end
end

#chooses another random item from deck
#adds that card value to hand_value
#passes back to hit_or_stay
def hit(deck, hand_value, card_1, card_2, card_values, d_hand_value)
	puts "You chose to hit."
	gets.chomp()
	puts "picking random item..."
	deck_size = deck.count - 1
	gets.chomp()
	rand = rand(0..deck_size)
	card_next = deck[rand]
	puts "******************"
	puts "NEXT CARD : #{deck[rand]}" #deck[rand]
	puts "******************"
	deck = deck - ["#{deck[rand]}"]
	#puts deck
	hand_value = hand_value + card_values[card_next]
	puts "Your new hand value is #{hand_value}"
	hit_or_stay(deck, hand_value, card_1, card_2, card_values, d_hand_value)
end

#keeps current card value
def stay(deck, hand_value, card_1, card_2, card_values, d_hand_value)
	puts "You chose to stay at #{hand_value}"
	game_over(hand_value, d_hand_value)
end

#makes a statement then ends the program
def game_over(hand_value, d_hand_value)

	puts "Your hand value was #{hand_value}"
	puts "The dealer's hand value was #{d_hand_value}"
	if hand_value > 21 and d_hand_value > 21
		puts "You both busted, nobody wins!"
	elsif d_hand_value > 21 and hand_value <= 21
		puts "The dealer busted, you win!"
	elsif hand_value > 21 and d_hand_value <= 21
		puts "You busted, the dealer wins!"
	elsif hand_value > d_hand_value
		puts "You were closer to 21, you win!"
	elsif d_hand_value > hand_value
		puts "The dealer was closer to 21, you lose!"
	else
		puts "WHAT THE FUCK JUST HAPPENED, I guess it was a tie."
	end
end

puts "starting..."
gets.chomp()
puts "******************"
deal(deck, card_values)