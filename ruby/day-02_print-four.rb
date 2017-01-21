numbers = 1..16

num_printed = 0
numbers.each do |x|
  print x
  num_printed += 1
  if num_printed < 4
    print " "
  else
    puts
    num_printed = 0
  end
end

numbers.each_slice(4) do |slice|
  slice.each {|num| print num.to_s + " "}
  puts
end
