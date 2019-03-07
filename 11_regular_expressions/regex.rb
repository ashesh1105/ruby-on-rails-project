### String: start_with?, .end_with?
phrase = "The Ruby Programming language is amazing!"
p phrase.start_with?("The") # print true
p phrase.downcase.start_with?("the") # print true
p phrase.end_with?("amazing!") # print true


### Regexp class: // Another Ruby objects, created with // syntax.
## Conditon is placed between two forward slashes.
# The =~ syntax will return the index position of first match.
# letters for regex can be put as such beteen // but special chars needs handling.
puts //.class # prints Regexp
puts phrase =~ /R/  # prints 4, the first first index of "R" in phrase string
# orders can change too, this produce same result!
puts /R/ =~ phrase  # still prints 4, the first index position of "R" in phrase
puts phrase =~ /!/  # prints 40, first index of "!" in phrase
p phrase =~ /tomb/  # prints nil since "tomb" doesn't exist in phrase string


### String.scan method: takes argument of a Regexp
## It gives all the matches found, not the index positions. Popular method!
voicemail = "I can be reached at 111-222-3456 or regexman@gmail.com"
# prints array of all "e"s found in string:
p voicemail.scan(/e/) # prints ["e", "e", "e", "e", "e"]
p voicemail.scan(/e/).length # prints 5, occurrences of "e"s in string
# sequence of characters search:
p voicemail.scan(/re/) # prints ["re", "re"]
# When order doesn't matter:
# Gives matches for either char "r", "e" or "I", an array like above
p voicemail.scan(/[reI]/) # prints ["I", "e", "r", "e", "e", "r", "r", "e", "e"]

# Digits: single digit /\d/  backslash + d means any single digit!
p voicemail.scan(/\d/)  # prints ["1", "1", "1", "2", "2", "2", "3", "4", "5", "6"]
# Digits: one or more consecutive set of digits: /\d+/
p voicemail.scan(/\d+/) # prints ["111", "222", "3456"]

# You can also attach a block to scan method:
voicemail.scan(/\d+/) {|digit_match| puts "#{digit_match} length: #{digit_match.length}"}
# prints:
# 111 length: 3
# 222 length: 3
# 3456 length: 4

### Wildcard symbol in Regexp:
## String.scan(/./) will match every character in string.
## String.scan(/.am/) will match <any_character> then sequency "am" in string
phrase = "The Ruby Programming language is amazing! I am practicing with version 2.3.3"
p phrase.scan(/.am/)  # prints ["ram", " am"], array of all occurrences of "<any_char>am" in phrase string.
p phrase.scan(/.ing/) # Like above, it prints: ["ming", "zing"]
# array of all occurrences of "a<any_character>e" in phrase string
p phrase.scan(/a.e/) # prints ["age"]
p phrase.scan(/R.b./) # prints ["Ruby"]
p phrase.scan(/\d.\d.\d/) # prints ["2.3.3"]

# any consecutive digits with any sigle character in between:
p voicemail.scan(/\d+.\d+.\d+/) # prints ["111-222-3456"]


### Backslash char in Regexp (\): means a lot of things:
paragraph = "This is my essay. I deserve an A. I rank it a 5 out of 5."

# escape character: \. Necessary to escape any character that have special meanings!
# . means any character, so when looking for literal . char, need to escape it!
p paragraph.scan(/\./)  # [".", ".", "."]
# any occurrence of a digit, not literal "d", so need to escape d here:
p paragraph.scan(/\d/)  # ["5", "5"]
# \D mean anything which is not a digit. Escaping is necessary here too to differetial it from "D":
p paragraph.scan(/\D/)  # prints large array of all non digit chars in string.
# \s means any white space character:
p paragraph.scan(/\s/).length # prints 15, number of white space chars in string.
# Like \d+ for digits, \s+ means any one or more white spaces:
p paragraph.scan(/\s+/).length # prints 15, number of one or more white space chars in string.
# Like \D, \S gives any non-white-space characters in string:
p paragraph.scan(/\S/)
# Leveraging above feature, below should give the word counts in string:
p paragraph.scan(/\S+/).length  # prints 16, non-white-space consecutive letters occurrences count!


### RegEx Anchors: indicates specific location where occurrences to look for:
poem = "99 bottles of beer of the wall, 99 bottles of beer"
p poem.scan(/\d+/)  # will print ["99", "99"], we know that.
# \A specifies looking at begining of the string:
p poem.scan(/\A\d+/) # ["99"]
# \z specifies looking at end of the string. \z has to be at end of regex expression
p poem.scan(/eer\z/) # ["eer"]

### Exclude characters: ^ operator:
## Example: print all consonents in string. So here, we will have to exclude
# all of vowels (lower / upper case), special characters, spaces, comma, dot, etc:
sales = "I bought 9 apples, 25 bananas and 4 oranges at the store."
puts sales.scan(/[^aeiouAEIOU \d,\.]/).length # prints 24 consonents present in sales string


### .sub and .gsub methods with Regexp
## .sub replaces one occurrence of one or more chars from a string, can take regex too.
# .sub does not overwrite original variable
# .sub changes only first occurrence, not the later ones:
puts "wordplay wolf".sub("w", "sw")  # prints swordplay wolf

## .gsub method replaces all occurrences of substring provided. g==global
puts "wordplay wolf".gsub("w", "sw")  # prints swordplay swolf
p "555 555 5555".gsub(" ", "-") # prints "555-555-5555"
# But gsub can get trickier and lengthy when we need to remove more characters,
# chaining of gsub methods gets combursome too:
# say, we need to replace all non numerical chars here with empty space "":
p "(555)-555 1234".gsub(" ", "").gsub("(", "").gsub(")", "").gsub("-", "")
# Regex with .gsub keeps it simple!
# "-" can be added as it is, \s for space, \( escapes "(" char, \) escapes ")"
p "(555)-555 1234".gsub(/[-\s\(\)]/, "")  # prints "5555551234"
# .sub or .gsub do not mutate original string, use bang version !sub / !gsub for that.


### Rubular is a great website to play around with Regexp! www.rubular.com
## You can practice below examples on this site too!
sentence = "The first phone number I called was 111-222-1234. I then called
another one: 444-567-9898 as well."
# {n} specifies occurrence of preceeding input in a regex
p sentence.scan(/\d{3}-\d{3}-\d{4}/)  # prints ["111-222-1234", "444-567-9898"]
# In above:
# \d{3} : means exactly 3 occurrences of any digits,
# - : then a -
# \d{3} : means exactly 3 occurrences of any digits,
# - : then a -
# \d{4} : means exactly 4 occurrences of any digits.
