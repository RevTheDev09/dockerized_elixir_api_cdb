defmodule BetApi.Guardian do
  use Guardian, otp_app: :bet_api
  import BetApi.Accounts

  alias BetApi.Accounts

  def subject_for_token(resource_id, _claims) do
    sub = to_string(resource_id)
    {:ok, sub}
  end

  def resource_from_claims(claims) do
    id = claims["sub"]
    resource = Accounts.get_by_id(id)
    {:ok, resource}
  end
end
