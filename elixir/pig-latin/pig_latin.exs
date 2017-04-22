defmodule PigLatin do
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
     ""   
     vowels = ["a", "e", "i", "o", "u", "yt", "xr"]
     words = 
        for w <- String.split(phrase) do
            cond do
              String.starts_with?(w, vowels) ->
                 "#{w}ay"
              String.starts_with?(w, ["squ", "thr", "sch"]) ->
                 "#{String.slice(w, 3..-1)}#{String.slice(w, 0..2)}ay"
              String.starts_with?(w, ["ch", "qu", "th"]) ->
                 "#{String.slice(w, 2..-1)}#{String.slice(w, 0..1)}ay"
              true ->
                 "#{String.slice(w, 1..-1)}#{String.slice(w, 0..0)}ay"
            end
        end
      Enum.join(words, " ")
  end
end

