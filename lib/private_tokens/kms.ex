defmodule PrivateTokens.KMS do
  @moduledoc """
  Module responsible for encrypting and decoding tokens.
  """
  @token_bytes 32

  def encrypt_token(token) do
    plaintext = Base.encode64(token)
    encrypt = ExAws.KMS.encrypt(kms_alias!(), plaintext)

    ExAws.request(encrypt)
  end

  def generate_token do
    :crypto.strong_rand_bytes(@token_bytes)
  end

  defp kms_alias!, do: System.fetch_env!("AWS_KMS_ALIAS")
end
