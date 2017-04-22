defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
     text 
       |> to_charlist
       |> Enum.map(
          fn (c) ->
            cond do
              ?a <= c && c <= ?z -> rem(c - ?a + shift, 26) + ?a
              ?A <= c && c <= ?Z -> rem(c - ?A + shift, 26) + ?A
              true -> c
            end
          end)
       |> to_string
  end
end

