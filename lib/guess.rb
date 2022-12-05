 
 # <summery> Functions to check how close a guess is to the code <summery>
class Guess

  def self.test_guess(code, guess)
    temp_code = code.dup
    responce = "\n"

    # Add a ✔ for each correct number in the correct position
    guess.each_char.with_index do |guess_char, i|
      code.each_char.with_index do |code_char, j|
        if i == j && guess_char == code_char
          responce << '✔'
          guess[i] = '0'
          temp_code[j] = '0'
        end
      end
    end

    # Remove 0 and duplicates in guess
    array = guess.split('') - ['0']
    guess = array.uniq.join('')

    # Add a ■ for each correct number in the incorrect positon
    guess.each_char do |char|
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

    return combinations
  end

  def self.computer_guess(code)
    combinations = Array.new
    combinations = possible_combinations
    saved_combinations = Array.new
    initial_guess = "1122"

    puts "The computers guessed: #{initial_guess}"

    response = test_guess(code, initial_guess)

    #test every number in possible combinations and save the ones that get the same response
    combinations.each do |combination|
      saved_combinations.push(combination) if test_guess(code, combination) == response
    end

  end





end