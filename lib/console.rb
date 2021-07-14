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
    if user_input.include?('n') || user_input.include?(' ')
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

  def invalid_input
    puts 'Enter from the color list.'
    listen_input
  end
end
