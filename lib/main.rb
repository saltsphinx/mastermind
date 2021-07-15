# frozen_string_literal: true

require_relative 'game'


def play_game 
  game = Game.new
  game.mastermind
end

play_game
