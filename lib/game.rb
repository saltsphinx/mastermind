# frozen_string_literal: true

require_relative 'codebreaker'
require_relative 'mastermind'
require_relative = 'board'

class Game

  COLOR_LIST = %w[
    r
    g
    p
    c
    b
    o
  ]

  def initialize
    
  end

  def game_menu
    puts "Welcome to Mastermind\n'P'lay\n'H'elp \n\n"
    user_choice = gets.chomp.downcase
    if user_choice.start_with?('p') 
      play_prompt
    elsif user_choice.start_with?('h')
      help_menu
    else
      game_menu
    end
  end

  def help_menu
    puts <<-HELP
    Mastermind is a game where one player, the mastermind,
    creates a code for the other player, the codebreaker, to
    break.
    
    There are six different colors('r'ed, 'b'lue, 'g'reen,
    'o'range, 'c'yan and 'p'urple) for the mastermind to
    choose from, with the code consisting of four colors. The
    mastermind can choose any assortment of colors, including
    duplicate colors.
    
    The codebreaker is given 8 rounds to try and break the code,
    and is given feedback on how close their guess is through
    four pegs. A white peg(w) represents a color is correct but
    isn't in the current position. The black peg(b) means a
    color is both correct and in the right position. An empty
    peg(x) means that a color isn't correct. The order of the pegs
    do not give away which color it represents.

    You can interact with the program by typing in a combination of
    letters, or full words. For example, for the code guess red,
    red, purple, green, you can type rrpg, r r p g, or red,
    or red, purple, green if you'd like.
    
    HELP
    puts "Press enter to return to the main menu. \n\n"
    gets
    game_menu
  end

  def play_prompt
    puts "Choose your game mode, or press enter to return to the main menu."
    puts "'C'odebreaker\n'M'astermind\n\n"
    user_choice = gets.chomp.downcase
    if user_choice.start_with?('c') 
      code_prompt
    elsif user_choice.start_with?('m')
      master_prompt
    else
      game_menu
    end
  end

  def code_prompt
    puts "Play as the codebreaker?\n'Y'es or 'N'o"
    user_choice = gets.chomp.downcase
    if user_choice.start_with?('y') 
      codebreaker
    elsif user_choice.start_with?('n')
      play_prompt
    else
      play_prompt
    end
  end

  def codebreaker
    @codebreaker = Codebreaker.new
    @codebreaker.play
  end

  def master_prompt
    puts "Play as the mastermind?\n'Y'es or 'N'o"
    user_choice = gets.chomp.downcase
    if user_choice.start_with?('y') 
      codebreaker
    elsif user_choice.start_with?('n')
      play_prompt
    else
      play_prompt
    end
  end

  def mastermind
    @mastermind = Mastermind.new
    @mastermind.play
  end

  def game_turn array
    code_array = array[1..4].map { |item| item.split('').first}
    return code_array if code_array.all? { |item| COLOR_LIST.include?(code_array)}
  end
end
