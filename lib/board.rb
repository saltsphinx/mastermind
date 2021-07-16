require_relative 'string'
require 'pry-byebug'

class Board
  attr_accessor :color_code, :rounds, :code_pegs, :key_pegs, :board

  def initialize
    @color_code = nil
    @code_pegs = nil
    @key_pegs = %w[+] * 4
    @rounds = 8
    @winner = nil
    @board = start_board
  end

  def generate_color_code
    color_choices = %w[r g p c b o ] * 4
    @color_code = 4.times.reduce([]) do |color_array, num|
      color_array.push(color_choices.slice!(color_choices.index(color_choices.sample)))
      color_array
    end
  end

  def set_code code
    @color_code = code
  end

  def guess_code guess
    self.code_pegs = guess
    self.rounds -= 1
  end

  def feedback
    dup_code = Array.new(color_code)
    self.key_pegs = []
    dup_code.each_with_index do |item, index|
      puts "item is #{item} index is #{index}"
      if dup_code.count(item) <= code_pegs.count(item)
        if item == code_pegs[index]
          self.key_pegs.push('b')
          dup_code[index] = nil
        else
          while dup_code.include?(item)
            self.key_pegs.push('w')
            dup_code[dup_code.index(item)] = nil #Errors when correct colors are in wrong order. For rorb, orbr and other combinations
          end
        end
      end
    end
    self.key_pegs.push('+') while key_pegs.length < 4
  end

  def feedback_sort
    key_pegs.sort_by {|i| %w[b w +].index(i)}
  end
  
  def board_actions
    sum_board if code_pegs
    show
  end

  def sum_board
    self.board << middle_board
  end

  def show
    puts self.board + bottom_board
  end

  def start_board
    <<-STARTER
      +----MASTERMIND----+
      |__________________|
    STARTER
  end

  def middle_board
    <<-MIDDLE
      |#{key_pegs[0]}#{key_pegs[1]}| #{code_pegs[0].send(code_pegs[0])}  #{code_pegs[1].send(code_pegs[1])}  #{code_pegs[2].send(code_pegs[2])}  #{code_pegs[3].send(code_pegs[3])} |#{key_pegs[2]}#{key_pegs[3]}|
    MIDDLE
  end

  def bottom_board
    unless game_over?
      <<-BOTTOM
      +------------------+
      |  | ?  ?  ?  ? |  |
      +------------------+
    BOTTOM
    else
      <<-BOTTOM
      +------------------+
      |  | #{color_code[0].send(color_code[0])}  #{color_code[1].send(color_code[1])}  #{color_code[2].send(color_code[2])}  #{color_code[3].send(color_code[3])} |  |
      +------------------+
      BOTTOM
    end
  end


  def game_over?
    if code_pegs == color_code
      true
      @winner = 'Codebreaker'
    elsif rounds.zero?
      true
      @winner = 'Mastermind'
    else
      false
    end
  end
end
