defmodule EevalWeb.UserController do
  use EevalWeb, :controller

  alias Eeval.Accounts
  alias Eeval.Accounts.User
  alias Eeval.Email
  alias Eeval.Mailer

  action_fallback EevalWeb.FallbackController

  def index(conn, _params) do
    users = Accounts.all()
    render(conn, "index.json", users: users)
  end

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Accounts.create(user_params) do
      Email.welcome_email(user) |> Mailer.deliver_now
      conn
      |> put_status(:created)
      |> put_resp_header("location", user_path(conn, :show, user))
      |> render("show.json", user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Accounts.get!(id)
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Accounts.get!(id)

    with {:ok, %User{} = user} <- Accounts.update(user, user_params) do
      render(conn, "show.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Accounts.get!(id)
    with {:ok, %User{}} <- Accounts.delete(user) do
      send_resp(conn, :no_content, "")
    end
  end
end
