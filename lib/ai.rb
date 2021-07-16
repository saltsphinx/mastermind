# frozen_string_literal: true

class AI
  attr_accessor :color_list, :confirmed_colors, :trash_colors, :board, :code_guess

  def initialize board
    @color_list = %w[r o g c b p]
    @code_guess = []
    @final_list = []
    @confirmed_colors = []
    @trash_colors = []
    @board = board
  end

  def single_play
    color = color_list.delete(color_list.sample)
    @color_guess = Array.new(4, color)
  end

  def confirm_play
    if confirmed_list.length >= 2
      
    else
      single_play
    end
  end
end