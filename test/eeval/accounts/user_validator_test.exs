defmodule Eeval.UserValidatorTest do
  use Eeval.DataCase, async: true
  import Eeval.Factory
  alias Eeval.Accounts.{User, UserValidator}

  describe "user_validator" do
    setup :changeset

    test "succeeds with a valid changeset", context do
      assert valid?(context.changeset)
    end

    @tag invalid: :first_name_presence
    test "fails with no first_name", context do
      refute valid?(context.changeset)
    end

    @tag invalid: :last_name_presence
    test "fails with no last_name", context do
      refute valid?(context.changeset)
    end

    @tag invalid: :username_presence
    test "fails with no username", context do
      refute valid?(context.changeset)
    end

    @tag invalid: :username_length
    test "fails with a short username", context do
      refute valid?(context.changeset)
    end

    @tag invalid: :username_uniqueness
    test "fails with non-unique username", context do
      assert {:error, _changeset} = Repo.insert(context.changeset)
    end

    @tag invalid: :email_presence
    test "fails with no email", context do
      refute valid?(context.changeset)
    end

    @tag invalid: :email_format
    test "fails with invalid email", context do
      refute valid?(context.changeset)
    end

    @tag invalid: :email_uniqueness
    test "fails with non-unique email", context do
      assert {:error, _changeset} = Repo.insert(context.changeset)
    end

    @tag invalid: :password_presence
    test "fails with no password", context do
      refute valid?(context.changeset)
    end

    @tag invalid: :password_length
    test "fails with a short password", context do
      refute valid?(context.changeset)
    end

    @tag invalid: :password_confirmation
    test "fails with no password confirmation", context do
      refute valid?(context.changeset)
    end
  end

  defp changeset(context) do
    [changeset: User.changeset(%User{}, invalid_params(context[:invalid]))]
  end

  def valid?(changeset) do
    changeset
    |> UserValidator.validate()
    |> UserValidator.valid?()
  end

  defp invalid_params(invalid_attribute) do
    case invalid_attribute do
      :first_name_presence ->
        params_for(:user, first_name: nil)

      :last_name_presence ->
        params_for(:user, last_name: nil)

      :username_presence ->
        params_for(:user, username: nil)

      :username_length ->
        params_for(:user, username: "u")

      :username_uniqueness ->
        existing_user = insert(:user)
        params_for(:user, username: existing_user.username)

      :email_presence ->
        params_for(:user, email: nil)

      :email_format ->
        params_for(:user, email: "invalid")

      :email_uniqueness ->
        existing_user = insert(:user)
        params_for(:user, email: existing_user.email)

      :password_presence ->
        params_for(:user, password: nil)

      :password_length ->
        params_for(:user, password: "p")

      :password_confirmation ->
        params_for(:user, password_confirmation: nil)

      _ ->
        params_for(:user)
    end
  end
end
