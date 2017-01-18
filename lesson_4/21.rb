CARDS = %w(2 3 4 5 6 7 8 9 10 J Q K A)

DECK = CARDS * 4

def prompt(message)
  puts "=> #{message}"
end

def shuffled_deck
  DECK.shuffle
end

def initial_deal(deck)
  [deck.pop, deck.pop]
end

def calculate_score(hand)
  score = 0
  hand.each do |card|
    if card == 'A'
      score += 11
    elsif card.to_i.zero?
      score += 10
    else
      score += card.to_i
    end
  end

  ace_count = hand.count('A')
  ace_count.times do
    score -= 10 if score > 21
  end
  score
end

def print_cards(hand)
  prompt "Cards are #{hand}"
end

prompt("Welcome to 21! Good luck!")

deck = shuffled_deck

player_hand = initial_deal(deck)

computer_hand = initial_deal(deck)

prompt "Dealer has #{computer_hand.first} and uknown card"
prompt "You have #{player_hand.first} and #{player_hand.last}"
loop do
  prompt "Hit or stay?"
  move = gets.chomp.downcase

  if move == 'hit'
    player_hand << deck.pop
    player_score = calculate_score(player_hand)
    print_cards(player_hand)
    if player_score > 21
      prompt "You lose!"
      break
    elsif player_score == 21
      prompt "You win!"
      break
    else
      prompt "Decisions, decisions"
    end
  else
    break
  end
end

player_score = calculate_score(player_hand)

if player_score < 21
  computer_score = calculate_score(computer_hand)

  while computer_score < 17 do
    computer_hand << deck.pop
    computer_score = calculate_score(computer_hand)
  end

  print_cards(computer_hand)

  if computer_score > 21
    prompt "Computer busts. You win!"
  elsif computer_score > player_score
    prompt "Computer wins!"
  else
    prompt "You win!"
  end
end

prompt "thank you for playing!"
