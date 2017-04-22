defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: ((any) -> boolean)) :: list(any)
  def keep(list, fun) do
    case list do
      [] -> []
      _ ->
        [f | r ] = list
        if fun.(f) do
            [f | keep(r, fun)]
        else
            keep(r, fun)
        end
    end
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: ((any) -> boolean)) :: list(any)
  def discard(list, fun) do
    case list do
      [] -> []
      _ ->
        [f | r ] = list
        if fun.(f) do
            discard(r, fun)
        else
            [ f | discard(r, fun) ]
        end
    end
  end
end

