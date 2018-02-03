defmodule Eeval.Validators.Behaviour do
  @callback validate(Ecto.Model.t()) :: Ecto.Model.t()
  @callback valid?(Ecto.Model.t()) :: boolean
end
