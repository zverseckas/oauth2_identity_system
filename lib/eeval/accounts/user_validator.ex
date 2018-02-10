defmodule Eeval.Accounts.UserValidator do
  import Ecto.Changeset

  @behaviour Eeval.Behaviours.Validator

  @required_attributes ~w(
    first_name
    last_name
    username
    email
    password
    password_confirmation
  )a

  @min_password_length 6
  @max_password_length 32
  @min_username_length 6
  @max_username_length 32

  @email_format ~r/@/

  def validate(%Ecto.Changeset{} = changeset) do
    changeset
    |> validate_required(@required_attributes)
    |> validate_confirmation(:password)
    |> validate_length(
      :password,
      min: @min_password_length,
      max: @max_password_length
    )
    |> validate_length(
      :username,
      min: @min_username_length,
      max: @max_username_length
    )
    |> validate_format(:email, @email_format)
    |> unique_constraint(:email)
    |> unique_constraint(:username)
  end

  def valid?(%Ecto.Changeset{valid?: valid}), do: valid
end
