 
 # <summery> Functions to check how close a guess is to the code <summery>
class Guess

  def self.test_guess(code, guess)
    temp_code = code.dup
    temp_guess = guess.dup
    responce = "\n"

    # Add a ✔ for each correct number in the correct position
    guess.each_char.with_index do |guess_char, i|
      code.each_char.with_index do |code_char, j|
        if i == j && guess_char == code_char
          responce << '✔'
          temp_guess[i] = '0'
          temp_code[j] = '0'
        end
      end
    end

    # Remove 0 and duplicates in guess
    array = temp_guess.split('') - ['0']
    temp_guess = array.uniq.join('')

    # Add a ■ for each correct number in the incorrect positon
    temp_guess.each_char do |char|
      count = temp_code.count(char)
      count.times do
        responce << '■'
      end
    end

    until responce.length == 5
      responce << '-'
    end

    responce
  end

  def self.possible_combinations
    combinations = Array.new
    number = ""

    1111.upto(6666) do |i|
      number = "#{i}"
      if !number["0"] && !number["7"] && !number["8"] && !number["9"]
        combinations.push(number) 
      end      
    end

    combinations
  end

  def self.computer_guess(combinations, guesses)
    random_number = rand(0..combinations.length-1)
    puts "Computer guess #{guesses}: #{combinations[random_number]}"

    combinations[random_number]
  end

  def self.calculate_from_guess(combinations, code, guess)
    response = test_guess(code, guess)

    combinations.each do |combination|
      if test_guess(combination, guess) != response
        combinations.delete(combination)
      end      
    end

    combinations
  end
end