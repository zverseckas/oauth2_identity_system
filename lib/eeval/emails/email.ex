defmodule Eeval.Email do
  import Bamboo.Email

  def welcome_email(recipient) do
    base_email(recipient)
    |> subject("Welcome!!")
    |> html_body("<strong>Welcome</strong>")
    |> text_body("Welcome")
  end

  defp base_email(recipient) do
    new_email(to: recipient)
    |> from("no-reply@eeval.com")
  end
end
