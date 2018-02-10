defmodule Eeval.Auth.Guardian do
  use Guardian, otp_app: :eeval

  alias Eeval.Accounts

  def subject_for_token(resource, _claims) do
    sub = Integer.to_string(resource.id)
    {:ok, sub}
  end
  # def subject_for_token(_, _) do
  #   {:error, :reason_for_error}
  # end

  def resource_from_claims(claims) do
    resource = Accounts.get!(claims["sub"])
    {:ok, resource}
  end
  # def resource_from_claims(_claims) do
  #   {:error, :reason_for_error}
  # end
end
