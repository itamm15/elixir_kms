defmodule PrivateTokens.Repo do
  use Ecto.Repo,
    otp_app: :private_tokens,
    adapter: Ecto.Adapters.Postgres
end
