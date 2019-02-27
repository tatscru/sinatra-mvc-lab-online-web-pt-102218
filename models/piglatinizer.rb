class PigLatinizer
  
  def to_pig_latin(phrase)
    words = phrase.split(" ")
    words.collect {|w| piglatinize(w)}.join(" ")
  end

  # def piglatinize(word)
  #   parts_of_word = word.split(/([^aeiouAEIOU]*)([aeiouAEIOU]*)(.*)/)
  
  #   beginning = parts_of_word[1] 
  #   ending = parts_of_word[2] + (parts_of_word[3] || "")
  #   if beginning.length>0
  #     "#{ending}#{beginning}ay"
  #   else
  #     "#{ending}way"
  #   end
  # end
  
  def piglatinize(word)
    return word if %w[and an in].include?(word) #one syllable exceptions
    letters = word.split("")
    letters.keep_if {|letter| letter != "."}
    if letters.size > 1
      until vowel?(letters[0]) 
        letters << letters.shift
      end
      letters  << "ay"
    end
    letters.join
  end
  
end