defmodule Eeval.UserTest do
  use Eeval.DataCase
  alias Eeval.Accounts.User
  import Eeval.Factory

  describe "user" do
    setup :change

    test "has a valid factory", context do
      assert context.changeset.valid?
    end
  end

  defp changeset(_context) do
    [changeset: User.changeset(%User{}, params_for(:user))]
  end
end
