defmodule Eeval.Auth do
  import Ecto.Changeset
  alias Comeonin.Bcrypt
  
  def hash_password(%Ecto.Changeset{changes: %{password: password}} = changeset) do
    change(changeset, Bcrypt.add_hash(password))
  end

  def hash_password(%Ecto.Changeset{} = changeset), do: changeset
end
