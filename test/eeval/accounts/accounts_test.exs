defmodule Eeval.AccountsTest do
  use Eeval.DataCase, async: true
  alias Eeval.{Accounts, Accounts.User}
  import Eeval.Factory

  @users_count 3

  setup do
    [user | _tail] = create_users()
    [user: user]
  end

  describe "accounts" do
    test "all/0 returns a list of all users" do
      users = Accounts.all()
      
      assert length(users) == @users_count
      assert [%User{} | _tail] = users
    end

    test "get/1 returns a user by id", context do
      assert %User{} = Accounts.get!(context.user.id)
    end

    test "get/1 raises an error when user is not found" do
      assert_raise Ecto.NoResultsError, fn ->
        Accounts.get!(-1)
      end
    end

    test "delete/1 deletes a user", context do
      {:ok, deleted} = Accounts.delete(context.user)

      assert deleted.id == context.user.id
      assert_raise Ecto.NoResultsError, fn ->
        Accounts.get!(deleted.id)
      end
    end

    test "changeset/1 returns a user changeset", context do
      assert Accounts.changeset(context.user) ==
        User.changeset(context.user, %{})
    end

    test "create/1 creates a user from attributes" do
      attrs = params_for(:user)
      {:ok, user} = Accounts.create(attrs)

      assert user.first_name == attrs.first_name
      assert user.last_name == attrs.last_name
      assert user.username == attrs.username
      assert user.email == attrs.email
      assert user.password_hash

      refute user.password
      refute user.password_confirmation
    end

    test "update/2 updates a user from attributes", context do
      attrs = params_for(:user)
      {:ok, user} = Accounts.update(context.user, attrs)

      assert user.first_name == attrs.first_name
      assert user.last_name == attrs.last_name
      assert user.username == attrs.username
      assert user.email == attrs.email
      assert user.password_hash

      refute user.password
      refute user.password_confirmation
    end
  end

  defp create_users do
    Enum.map(1..@users_count, fn _ -> insert(:user) end)
  end
end
