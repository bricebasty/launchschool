=begin

WELCOME

GOAL

Press enter when you're ready

=end

###############################
# FORMATTING FOR THE TERMINAL #
###############################

RESET = "\e[0m"
BOLD = "\e[1m"
ITALIC = "\e[3m"
SLOW_BLINK = "\e[5m"
RAPID_BLINK = "\e[6m"
HIDE_CURSOR = "\e[?25l"
SHOW_CURSOR = "\e[?25h"

# Text colors
BLACK = "\e[30m"
RED = "\e[31m"
GREEN = "\e[32m"
YELLOW = "\e[33m"
BLUE = "\e[34m"
MAGENTA = "\e[35m"
CYAN = "\e[36m"
WHITE = "\e[37m"

# Background colors
RED_BG = "\e[41m"
GREEN_BG = "\e[42m"
YELLOW_BG = "\e[43m"

WELCOME_SCREEN = <<~WELCOME_SCREEN
#{HIDE_CURSOR}#{BLUE}
████████╗██╗ █████╗       ████████╗ █████╗  █████╗       ████████╗ █████╗ ███████╗
╚══██╔══╝██║██╔══██╗      ╚══██╔══╝██╔══██╗██╔══██╗      ╚══██╔══╝██╔══██╗██╔════╝
   ██║   ██║██║  ╚═╝█████╗   ██║   ███████║██║  ╚═╝█████╗   ██║   ██║  ██║█████╗\u{200b}\u{200b}
   ██║   ██║██║  ██╗╚════╝   ██║   ██╔══██║██║  ██╗╚════╝   ██║   ██║  ██║██╔══╝\u{200b}\u{200b}
   ██║   ██║╚█████╔╝         ██║   ██║  ██║╚█████╔╝         ██║   ╚█████╔╝███████╗
   ╚═╝   ╚═╝ ╚════╝          ╚═╝   ╚═╝  ╚═╝ ╚════╝          ╚═╝    ╚════╝ ╚══════╝
#{SLOW_BLINK}#{YELLOW}
█▀▀█  █▀▀█  █▀▀▀  █▀▀▀█  █▀▀▀█    █▀▀▀  █▄  █ ▀▀█▀▀  █▀▀▀  █▀▀█\u{200b}
█▄▄█  █▄▄▀  █▀▀▀  ▀▀▀▄▄  ▀▀▀▄▄    █▀▀▀  █ █ █   █    █▀▀▀  █▄▄▀\u{200b}
█     █  █  █▄▄▄  █▄▄▄█  █▄▄▄█    █▄▄▄  █  ▀█   █    █▄▄▄  █  █\u{200b}
#{RESET}
WELCOME_SCREEN

RULES = <<~RULES
██████╗ ██╗   ██╗██╗     ███████╗███████╗
██╔══██╗██║   ██║██║     ██╔════╝██╔════╝
██████╔╝██║   ██║██║     █████╗  ███████╗
██╔══██╗██║   ██║██║     ██╔══╝  ╚════██║
██║  ██║╚██████╔╝███████╗███████╗███████║
╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚══════╝╚══════╝


RULES

GOAL = <<~GOAL
#{GREEN}
 ██████╗  ██████╗  █████╗ ██╗\u{200b}\u{200b}\u{200b}\u{200b}\u{200b}
██╔════╝ ██╔═══██╗██╔══██╗██║\u{200b}\u{200b}\u{200b}\u{200b}\u{200b}
██║  ███╗██║   ██║███████║██║\u{200b}\u{200b}\u{200b}\u{200b}\u{200b}
██║   ██║██║   ██║██╔══██║██║\u{200b}\u{200b}\u{200b}\u{200b}\u{200b}
╚██████╔╝╚██████╔╝██║  ██║███████╗
 ╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚══════╝
#{BOLD}#{WHITE}
GET 3 OF YOUR MARKS (REPRESENTED BY X OR O)
ALIGNED HORIZONTALLY, VERTICALLY OR DIAGONALLY
#{ITALIC}#{YELLOW}
PRESS ENTER WHEN YOU'RE READY
#{RESET}
GOAL

def clear_terminal
  system("clear") || system("cls")
end

def center_text(text)
  terminal_width = `/usr/bin/env tput cols`.to_i
  text.split("\n").map do |line|
    padding = (terminal_width - line.length) / 2
    line.prepend(' ' * padding)
  end.join("\n")
end

def print_progressively(str, line_delay: 0.02)
  str.each_line do |line|
    print line
    sleep line_delay
  end
end

def display_screen(screen)
  clear_terminal
  centered_text = center_text(screen)
  print(centered_text)
end

def initialize_board
  Array.new(9) { |i| (i + 1).to_s }
end

def reset_board
  Array.new(9) { |i| (i + 1).to_s }
end

def update_cell(cell, number, sign)
  cell[number - 1] = sign
end

def show_board
  puts [top_line, formatted_rows.join("\n#{horizontal_separator}\n"), bottom_line].join("\n")
end

top_line = '┌─────────┬─────────┬─────────┐'
bottom_line =  '└─────────┴─────────┴─────────┘'
horizontal_separator = '├─────────┼─────────┼─────────┤'

def formatted_rows
  rows = []

  # Construct each row in the board
  (1..3).each_with_object([]) { |row, rows| rows << row }
    cells = [] # Initialize cells array to hold the cells in the current row

    # Construct each cell in the current row
    3.times do |c|
      cells << cell_output(r, c) # Get the corresponding colored console output
    end

    # Add the formatted row to the rows array
    rows << cells.transpose.map { |row| "│ #{row.join(' │ ')} │" }.join("\n")
  end

  rows
end

def cell_output(row, column)
  cell_value = @cells[row * 3 + column] # Get the current cell's value
  mappings[cell_value]
end

def mappings
  # Mapping of cell values to their colored console output
  { 'X' => [" #{B_RED}\\   /#{RESET} ", "  #{B_RED}>-<#{RESET}  ", " #{B_RED}/   \\#{RESET} "],
    'O' => ["  #{B_GREEN}---#{RESET}  ", " #{B_GREEN}|   |#{RESET} ", "  #{B_GREEN}---#{RESET}  "],
    '1' => ['       ', "   #{B_YELLOW}1#{RESET}   ", '       '],
    '2' => ['       ', "   #{B_YELLOW}2#{RESET}   ", '       '],
    '3' => ['       ', "   #{B_YELLOW}3#{RESET}   ", '       '],
    '4' => ['       ', "   #{B_YELLOW}4#{RESET}   ", '       '],
    '5' => ['       ', "   #{B_YELLOW}5#{RESET}   ", '       '],
    '6' => ['       ', "   #{B_YELLOW}6#{RESET}   ", '       '],
    '7' => ['       ', "   #{B_YELLOW}7#{RESET}   ", '       '],
    '8' => ['       ', "   #{B_YELLOW}8#{RESET}   ", '       '],
    '9' => ['       ', "   #{B_YELLOW}9#{RESET}   ", '       '] }
end
end


def main
  display_screen(WELCOME_SCREEN)
  input = gets until input == "\n"
  display_screen(GOAL)

  print SHOW_CURSOR
end

main
