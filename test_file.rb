require 'pry-byebug'

def feedback
  dup_code = %w[r o r b]
  key_pegs = []
  code_pegs = %w[o r b r]
  dup_code.each_with_index do |i, n|
    if dup_code.count(i) <= code_pegs.count(i)
      if dup_code[n] == code_pegs[n]
        key_pegs.push('b')
        dup_code[n] = nil
      else
        while dup_code.include?(code_pegs[n])
          key_pegs.push('w')
          binding.pry
          dup_code[dup_code.index(i)] = nil
        end
      end
    end
  end
  key_pegs.push('+') while key_pegs.length < 4
end

feedback