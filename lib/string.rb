# frozen_string_literal: true

class String 
  def r;         self.center(3);"\e[41m#{self}\e[0m" end
  def g;       "\e[42m#{self}\e[0m" end
  def o;       "\e[43m#{self}\e[0m" end
  def b;        "\e[44m#{self}\e[0m" end
  def p;     "\e[45m#{self}\e[0m" end
  def c;        "\e[46m#{self}\e[0m" end
  def bold;           "\e[1m#{self}\e[22m" end
end