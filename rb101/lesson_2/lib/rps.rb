VALID_CHOICES = ['rock', 'paper', 'scissors', 'spock', 'lizard']

WIN_CONDITIONS = {
  'rock' => ['scissors', 'lizard'],
  'paper' => ['rock', 'spock'],
  'scissors' => ['lizard', 'paper'],
  'spock' => ['rock', 'scissors'],
  'lizard' => ['spock', 'paper']
}

def win?(first, second)
  WIN_CONDITIONS[first].include?(second)
end

def display_results(player, computer)
  if win?(player, computer)
    print_colorized_string(MESSAGES[LANGUAGE]['win'], 32)
  elsif win?(computer, player)
    print_colorized_string(MESSAGES[LANGUAGE]['lose'], 31)
  else
    print_colorized_string(MESSAGES[LANGUAGE]['tie'], 33)
  end
end

def count_wins(player, computer, wins)
  wins[:player] += 1 if win?(player, computer)
  wins[:computer] += 1 if win?(computer, player)
end

def ask_for_sign
  loop do
    print_string("Choose one: #{VALID_CHOICES.join(', ')}", print_user: true)

    player_choice = gets.chomp.downcase

    if VALID_CHOICES.any? { |choice| choice.start_with?(player_choice) }
      return VALID_CHOICES.find { |choice| choice.start_with?(player_choice) }
    else
      print_colorized_string(MESSAGES[LANGUAGE]['invalid_input'], 34,
                             print_user: true)
    end
  end
end

def launch_match_loop(wins)
  loop do
    player_choice = ask_for_sign
    computer_choice = VALID_CHOICES.sample

    print_string("You: #{player_choice}. Computer: #{computer_choice}")

    display_results(player_choice, computer_choice)

    count_wins(player_choice, computer_choice, wins)

    break if wins.value?(3)
  end
end

def launch_game_loop
  loop do
    wins = { player: 0, computer: 0 }
    launch_match_loop(wins)

    puts "\e[36m#{wins.key(3).capitalize} has won"

    print_colorized_string(MESSAGES[LANGUAGE]['start_again'], 35,
                           print_user: true)

    answer = gets.chomp
    break unless answer.downcase.start_with?('y')
  end

  print_colorized_string(MESSAGES[LANGUAGE]['thank_you'], 32)
end
