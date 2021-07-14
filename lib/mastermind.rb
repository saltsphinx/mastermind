# frozen_string_literal: true

require_relative 'codebreaker'
require_relative = 'board'

class Mastermind

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
      game_menu
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

  def game_turn array
    code_array = array[1..4].map { |item| item.split('').first}
    return code_array if code_array.all? { |item| COLOR_LIST.include?(code_array)}
  end
end
