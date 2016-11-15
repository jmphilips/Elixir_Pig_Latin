defmodule PigLatin do

    def vowel_list do
        ["a", "e", "i", "o", "u"]
    end
 
    def is_vowel?(word) do
        [first_letter | _tail] = String.split(word, "")
        Enum.member?(vowel_list, String.downcase(first_letter))
    end



end
