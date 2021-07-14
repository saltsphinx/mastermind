# frozen_string_literal: true

module Console
  attr_accessor :user_input

  COLOR_LIST = %w[
    r
    g
    p
    c
    b
    o
  ]

  def listen_input
    self.user_input = gets.chomp.downcase
    if user_input.include?('h')
      return help
    elsif user_input.include?('n') || user_input.include?(' ')
      self.user_input = user_input.split(/[,|\s]+/)[0,4]
      return validate_input
    else
      self.user_input = user_input.split('')[0,4]
      return validate_input
    end
    invalid_input
  end

  private

  def validate_input
    if user_input.length == 4
      self.user_input = self.user_input.map { |w| w[0,1]}
      return user_input if user_input.all? { |l| COLOR_LIST.include?(l)}
    end
    invalid_input
  end

  def help
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
    puts "Press enter to return to the game. \n\n"
    gets
    listen_input 
  end

  def invalid_input
    puts 'Enter from the color list.'
    listen_input
  end
end
