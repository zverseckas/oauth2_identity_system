defmodule EevalWeb.Router do
  use EevalWeb, :router

  if Mix.env == :dev do
    forward "/sent_emails", Bamboo.EmailPreviewPlug
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", EevalWeb do
    pipe_through :api
    resources "/users", UserController, except: [:new, :edit]
  end
end
