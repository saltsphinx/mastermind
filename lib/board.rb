
class Board
  attr_accessor :color_code, :code_pegs, :key_pegs, :board

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

  def guess_code guess
    self.code_pegs = guess
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
      |#{key_pegs[0]}#{key_pegs[1]}| #{code_pegs[0]}  #{code_pegs[1]}  #{code_pegs[2]}  #{code_pegs[3]} |#{key_pegs[2]}#{key_pegs[3]}|
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
      |  | #{color_code[0]}  #{color_code[1]}  #{color_code[2]}  #{color_code[3]} |  |
      +------------------+
      BOTTOM
    end
  end

  def game_over?
    if @code_guess == @color_code
      true
      @winner = 'Codebreaker'
    elsif
      true
      @winner = 'Mastermind'
    else
      false
    end
  end
end
