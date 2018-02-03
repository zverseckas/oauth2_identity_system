defmodule Eeval.Accounts.User do
  use Ecto.Schema
  alias Eeval.{Accounts.User, Validators}
  import Ecto.Changeset

  @attributes ~w(
    first_name
    last_name
    username
    email
    password
    password_confirmation
  )a

  def attributes, do: @attributes

  schema "users" do
    field(:email, :string)
    field(:username, :string)
    field(:first_name, :string)
    field(:last_name, :string)
    field(:password, :string, virtual: true)
    field(:password_confirmation, :string, virtual: true)
    field(:password_hash, :string)
    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs \\ %{}) do
    user
    |> cast(attrs, @attributes)
    |> Validators.User.validate()
  end
end
