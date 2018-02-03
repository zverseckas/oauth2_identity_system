defmodule Eeval.UserTest do
  use Eeval.DataCase
  import Eeval.Factory

  describe "user" do
    alias Eeval.Accounts.User

    test "has a valid factory" do
      u = User.changeset(%User{}, params_for :user)
      IO.inspect(Eeval.Auth.Password.encrypt_in_changeset u)
      assert u.valid?
    end
  end
end