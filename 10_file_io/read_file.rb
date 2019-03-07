### File read. "r" option is default, so optional
File.open("./some_file.txt", "r").each do |line|
  puts line
end
