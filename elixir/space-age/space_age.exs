defmodule SpaceAge do
  @type planet :: :mercury | :venus | :earth | :mars | :jupiter
                | :saturn | :uranus | :neptune

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
     earth_year =  seconds /  31557600
     case planet do 
      :earth   ->  earth_year 
      :mercury ->  earth_year /  0.2408467
      :venus   ->  earth_year /  0.61519726
      :mars    ->  earth_year /  1.8808158
      :jupiter ->  earth_year /  11.862615
      :saturn  ->  earth_year /  29.447498
      :uranus  ->  earth_year /  84.016846
      :neptune ->  earth_year /  164.79132
     end
  end
end
