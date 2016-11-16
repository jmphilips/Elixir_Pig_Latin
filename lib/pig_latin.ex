defmodule PigLatin do

    def vowel_list do
        ["a", "e", "i", "o", "u"]
    end

    def length_tuple(word) do
       {String.length(word), word, is_vowel?(word)} |> word_maker
    end
 
    def is_vowel?(word) do
        [first_letter | _tail] = String.split(word, "")
        Enum.member?(vowel_list, String.downcase(first_letter))
    end

    def word_maker_three_or_more(word) do
        [first_letter, second_letter | tail ] = String.split(word, "")
        List.to_string([tail, String.downcase(first_letter), second_letter, "ay"])
    end

    def pig_latin_sentence(sentence) do
        String.split(sentence, " ")
        |> Enum.map(fn (word) -> length_tuple(word) end)
        |> Enum.join(" ")
    end

   def word_maker_vowel_first_letter(word) do
       String.downcase(word) <> "ay"
   end

   def word_maker_less_than_three(word) do
        [first_letter | tail ] = String.split(word, "")
        List.to_string([tail, first_letter])
   end

   def word_maker({length, word, is_vowel_bool}) do
       case is_vowel_bool do
           true -> word_maker_vowel_first_letter(word)
           false -> case length do
                        1 -> word
                        2 -> word_maker_less_than_three(word)
                        _ -> word_maker_three_or_more(word)
            end
        end
   end


   def is_vowel_mapped(word) do
       word 
       |> String.split("")
       |> Enum.map(fn (char) -> Enum.member?(vowel_list, char) end)
       |> Enum.find_index(fn(bool) -> bool == true end)
   end

   def string_splitter(word) do
       String.split_at(word, is_vowel_mapped(word))
       |> Tuple.to_list
   end

   def list_to_string(list) do
       [first, second] = list 
       Enum.join([second, first])
   end
end