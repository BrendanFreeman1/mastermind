 
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

    1.upto(6) do |i|
      number = "111#{i}"
      combinations.push(number) if !number["0"]
    end

    11.upto(66) do |i|
      number = "11#{i+1}"
      combinations.push(number) if !number["0"]
    end

    111.upto(666) do |i|
      number = "1#{i}"
      combinations.push(number) if !number["0"] 
    end

    1111.upto(6666) do |i|
      number = "#{i}"
      combinations.push(number) if !number["0"] 
    end

    combinations
  end

  def self.computer_guess(combinations)
    puts "The computers guessed: #{combinations[0]}"

    combinations[0]
  end

  def self.calculate_from_guess(combinations, code, guess)
    response = test_guess(code, guess)

    #test every number in possible combinations and save the ones that get the same response
    combinations.each do |combination|
      if test_guess(code, combination) != response
      #I THINK THIS IS WIPING OUT THE ENTIRE ARRAY
      #  combinations = combinations.delete(combination) 
      end
    end

    combinations
  end
end