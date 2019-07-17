#!/usr/bin/env ruby
require('pry')

def is_palindrome?(sentence)
  sentence.delete ' '
  sentence.upcase.downcase!
  i = 0
  neg_i = -1

  if sentence.length <=1
    return false
  end

  is_palindrome_return = true
  (sentence.length / 2).times do
    if sentence[i] === sentence[neg_i]
      true
    else
      is_palindrome_return =  false
    end
    i += 1
    neg_i -= 1

  end
  return is_palindrome_return

end

while true do
  puts "Are you using a file, or entering your own sentence?"
  puts "Type 'file' for file or 'sentence' for sentence"
  user_decision = gets.chomp
  if user_decision.upcase == "Q"
    break
  end
  if user_decision == "file"
    puts "Enter a file path"
    user_file_path = gets.chomp
    file = File.open(user_file_path)
    file_data = file.read.chomp
    file.close
    puts "Is this a palindrome?"

    file_data.upcase!.downcase!.gsub!(/[“”’.…!,?'"$-=()]/, '')
    word_array = file_data.split(" ")

    palindromes_found = []
    if word_array.length > 1

      x = 0
      while x < (word_array.length)
        y = 1
        while y < (word_array.length + 1)
          word_combo = word_array[x,y].join
          puts "value of X"
          puts x
          puts "value of Y"
          puts y
          if is_palindrome?(word_combo) == true
            palindromes_found.push(word_array[x,y].join(" "))
          end
          y+=1
        end

        x+=1
      end

      else
        if is_palindrome?(word_array[0]) == true
          palindromes_found.push(word_array[0])
        end
    end

    puts "Palindromes found:"
    puts palindromes_found.length
    puts palindromes_found
    #

    sleep(2)
  end
  if user_decision == "sentence"
    puts "Is your sentence a palindrome?"
    puts "Enter a sentence"
    user_phrase = gets.chomp
    if (user_phrase.upcase === "Q")
      break
    end
    puts is_palindrome?(user_phrase)
    sleep(2)
  end
end
