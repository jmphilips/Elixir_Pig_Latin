defmodule PigLatin do

    def vowel_list do
        ["a", "e", "i", "o", "u"]
    end
 
    def is_vowel?(word) do
        [first_letter | _tail] = String.split(word, "")
        Enum.member?(vowel_list, String.downcase(first_letter))
    end

    def word_maker(word) do
        [first_letter, second_letter | tail ] = String.split(word, "")
        List.to_string([tail, String.downcase(first_letter), second_letter])
    end

    def pig_latin_sentence(sentence) do
        String.split(sentence, " ")
        |> Enum.map(fn (word) -> word_maker(word) end)
    end

end