# frozen_string_literal: true

require_relative 'mastermind'


def play_game 
  game = Mastermind.new
  game.game_menu
end

play_game
