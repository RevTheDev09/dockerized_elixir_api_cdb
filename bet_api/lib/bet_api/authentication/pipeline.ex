defmodule BetApi.Guardian.AuthPipeline do
  @claims %{type: "access"}

  use Guardian.Plug.Pipeline,
    otp_app: :bet_api,
    module: BetApi.Guardian,
    error_handler: BetApi.Guardian.AuthErrorHandler

  plug(Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"}, schema: "Bearer")
  plug(Guardian.Plug.EnsureAuthenticated)
  plug(Guardian.Plug.LoadResource, ensure: true)
end
