# frozen_string_literal: true

require_relative 'board'
require_relative 'console'

class Codebreaker
  attr_accessor :board

  include Console

  def initialize
    @board = Board.new
  end

  def play
    board.generate_color_code
    until board.game_over?
      board.board_actions
      board.guess_code(listen_input)
      board.feedback
    end
    board.board_actions
    puts 'over'
  end
end
