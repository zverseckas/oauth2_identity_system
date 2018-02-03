defmodule Eeval.Auth.Password do
  alias Comeonin.Bcrypt
  import Ecto.Changeset

  def encrypt_in_changeset(%Ecto.Changeset{changes: %{password: password}} = changeset) do
    change(changeset, Bcrypt.add_hash(password))
  end

  def encrypt_in_changeset(%Ecto.Changeset{} = changeset), do: changeset
end
