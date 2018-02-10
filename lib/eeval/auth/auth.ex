defmodule Eeval.Auth do
  import Ecto.Changeset
  alias Comeonin.Bcrypt
  
  def hash_password(%Ecto.Changeset{changes: %{password: password}} = changeset) do
    changes =
      password
      |> Bcrypt.add_hash()
      |> Map.put(:password_confirmation, nil)
    
    change(changeset, changes)
  end

  def hash_password(%Ecto.Changeset{} = changeset), do: changeset
end
