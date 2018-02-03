defmodule Eeval.Factory do
  use ExMachina.Ecto, repo: Eeval.Repo
  use Eeval.Factories.User
end
