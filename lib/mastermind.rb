# frozen_string_literal: true

require_relative 'board'
require_relative 'console'

class Mastermind
  attr_accessor :board

  include Console

  def initialize
    @board = Board.new
  end

  def play
    puts 'Enter your code.'
    board.set_code(%w[r o r b])
    until board.game_over?
      board.board_actions
      board.guess_code(listen_input)
      board.feedback
    end
    board.board_actions
    puts 'over'
  end
end
