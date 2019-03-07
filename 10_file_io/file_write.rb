### Writing to a file.
## "w" option overwrites the file. Use "a" option to append
File.open("./some_file.txt", "w") do |file|
  file.puts "Writing some text in file with file.puts."
  file.print "More content with file.print."
  file.write "file.write does not add line breaks! Same as file.print!"
  file.write "Another sentence written with file.write."
end

File.open("./some_file.txt", "a") do |file|
  file.puts "Write more text using \"a\" option so it is appended to end of file."
  file.puts "Some more text using \"a\" option instead of \"w\" option."
  file.puts "Remember, \"w\" option overwrites a file content!!"
end

### File.rename and File.delete methods
File.open("./file_to_rename_delete.txt", "a") do |file|
  file.puts "Adding some content on this file, which will be temporary."
end

# Let's rename above file now.
# Below code are valid, uncomment them to test:
# if File.exists?("file_to_rename_delete.txt")  # ensure that file exists!
#   File.rename("file_to_rename_delete.txt", "renamed_temporary_file.txt")
# end
# #
# # # Let's delete above file now:
# if File.exists("renamed_temporary_file.txt")  # ensure file exists!
#   File.delete("renamed_temporary_file.txt")
# end
