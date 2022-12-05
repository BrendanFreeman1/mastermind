# frozen_string_literal: true

# <summery> Functions for getting and checking the players code <summery>
class PlayerCode
  def player_code
    correct_input = false

    until correct_input
      code = gets.strip

      correct_input = check_code_range(code)

      check_code_chars(code)
    end

    code
  end

  def check_code_range(code)
    return true if code.to_i >= 1111 && code.to_i <= 6666

    puts 'Incorrect input, enter four of the following digits: 1, 2, 3, 4, 5, 6'
    false
  end

  def check_code_chars(code)
    code.each_char do |char|
      if char.to_i.zero?
        puts 'Input must be digits only'
        break
      end
    end
  end
end
