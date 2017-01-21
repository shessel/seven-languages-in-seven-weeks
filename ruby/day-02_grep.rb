pattern = Regexp.new ARGV[0]
filename = ARGV[1]

File.open(filename) do |file|
  file.each_with_index do |line, index|
    puts "#{index + 1}: #{line}" if line =~ pattern
  end
end
