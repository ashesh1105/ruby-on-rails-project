### Check file_write.rb and file_read.rb for File read / write related operations.

### ARGV array: This stores command line arguments passed to Ruby script:
## Say, a bunch of numbers passed as command line arguments and we need to
# print their squares:
ARGV.each do |arg|
  number = arg.to_i
  puts "Square of #{number}: #{number ** 2}"
end   # Run this in terminal as "ruby file_io.rb 2 5 10 12"
      # Output:
      # Square of 2: 4
      # Square of 5: 25
      # Square of 10: 100
      # Square of 12: 144


### load a file:
## Created a file load_file.rb and added some put statements in that.
load "./load_file.rb" # should print output from contents of load_file.rb:
# This file will be loaded by file_io.rb
# This will demonstrate that any valid Ruby file can be loaded into another.
# Helps pull in Ruby functionality from one .rb file to another!.
# Only a file with .rb extension can be loaded!


### The require and require_relative Methods. They are Ruby's import statement equivalent.
## require_relative expects import files to be in same directory, so "./" don't
# need to be prefixed with file name for require_relative. You can provide
# path of file to be loaded relative to current directory like:
# require_relative "a/b/c/xyz.rb" # .rb is not required, you can omit it
