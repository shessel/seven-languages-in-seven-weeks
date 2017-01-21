number = rand(10)
puts 'Guess the number'

until (guess = gets().to_i) == number
  if guess < number
    puts 'Too low'
  else
    puts 'Too high'
  end
end

puts "#{number} is correct"
