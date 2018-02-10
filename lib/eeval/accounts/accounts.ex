defmodule Eeval.Accounts do
  import Ecto.Query, warn: false
  alias Eeval.{Repo, Accounts.User, Auth}

  def all, do: Repo.all(User)
  def get!(id), do: Repo.get!(User, id)
  def delete(%User{} = user), do: Repo.delete(user)
  def changeset(%User{} = user), do: User.changeset(user, %{})

  def create(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Auth.hash_password()
    |> Repo.insert()
  end

  def update(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Auth.hash_password()
    |> Repo.update()
  end
end
