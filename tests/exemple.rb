require 'pry'

class BoardCase
  attr_accessor :number, :value

  def initialize(number)
    @number = number
    @value = " "
  end
end

class Player
  attr_accessor :name, :sign

  def initialize(name, sign)
    @name = name
    @sign = sign
  end
end

class Board
  attr_accessor :cases

  def initialize
    @cases = Array.new(3) { (0..2).map { |e| BoardCase.new(e) } }
  end

  def show
    puts "Voici la table de jeu\n\n"
    puts "    1   2   3"
    puts "  -------------"
    @cases.each_with_index do |line, index|
      print "#{index + 1} "
      line.each do |column|
        print "| #{column.value} "
      end
      puts "|"
      puts "  -------------"
    end
    puts
  end

  def fill(line, column, sign)
    @cases[line][column].value = sign
  end

  def reset
    @cases.each { |line| line.each { |board_case| board_case.value = " " } }
  end
end

class Game
  WINNING_COMBINATIONS = [
    [
      [0, 0], [0, 1], [0, 2]
    ],
    [
      [1, 0], [1, 1], [1, 2] # <--
    ],
    [
      [2, 0], [2, 1], [2, 2]
    ],
    [
      [0, 0], [1, 0], [2, 0]
    ],
    [
      [0, 1], [1, 1], [2, 1]
    ],
    [
      [0, 2], [1, 2], [2, 2]
    ],
    [
      [0, 0], [1, 1], [2, 2]
    ],
    [
      [2, 0], [1, 1], [0, 2]
    ]
  ]

  def display_text(string)
    puts string
    print "> "
  end

  def initialize
    display_text("Joueur 1 quel est ton prénom?")
    @player1 = Player.new(gets.chomp, "X")
    display_text("Joueur 2 quel est ton prénom?")
    @player2 = Player.new(gets.chomp, "O")
    @board = Board.new
    @turn = 0
    @players = [@player1, @player2]
    @current_player = 0
    perform
  end

  def ask_player
    loop do
      display_text("#{@players[@current_player].name}, choisis une colonne sur laquelle jouer")
      column = (gets.chomp.to_i) - 1
      display_text("Maintenant, choisis une ligne sur laquelle jouer")
      line = (gets.chomp.to_i) - 1

      return line, column if valid_move?(line, column)
      puts "Entrée invalide, réessaye."
    end
  end

  def valid_move?(line, column)
    (0..2).include?(line) && (0..2).include?(column) && @board.cases[line][column].value == " "
  end

  def victory?
    WINNING_COMBINATIONS.any? do |positions|
      line, col = positions.first
      first_value = @board.cases[line][col].value
      next if first_value == " "
      positions.all? { |(line, col)| @board.cases[line][col].value == first_value }
    end
  end

  def finished?
    victory? || @turn == 9
  end

  def change_current_player
    @current_player = @turn.even? ? 1 : 0
  end

  def play_round
    @board.show

    until finished? && @turn > 0
      @turn += 1
      change_current_player
      @board.fill(*ask_player, @players[@current_player].sign)
      @board.show
    end
  end

  def tell_winner
    puts victory? ? "#{@players[@current_player].name} a gagné" : "Match nul"
  end

  def replay?
    display_text("Veux tu rejouer?")
    ["y", "yes", "o", "oui", "ouais"].include?(gets.chomp.downcase) ? true : exit
  end

  def reset_game
    @board.reset
    @turn = 0
  end

  def perform
    loop do
      play_round
      tell_winner
      break unless replay?
      reset_game
    end
  end
end

Game.new
