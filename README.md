```elixir
iex(24)> token = PrivateTokens.KMS.generate_token()
<<102, 32, 58, 189, 22, 62, 81, 118, 110, 120, 33, 165, 241, 201, 119, 53, 80,
  36, 86, 175, 145, 94, 33, 31, 122, 233, 83, 117, 46, 59, 19, 233>>
iex(25)> PrivateTokens.KMS.encrypt_token(token)
{:ok,
 %{
   "CiphertextBlob" => "YjlmMWU0NmQtYTYwZC00NmEzLTg3ZDgtN2U3YTcyNmNhODM4gitXS8Jh9rIuR0DXnhosy2cKEB+Tf6marKZIyY1pc7PC/fAB4JDpQoWIZfEe2zP744Y4pq0BLkT/8ZGuBlf8PC8yz/tAbFQAhsCCvHwRpD8=",
   "KeyId" => "arn:aws:kms:us-east-1:000000000000:key/b9f1e46d-a60d-46a3-87d8-7e7a726ca838"
 }}
iex(26)> PrivateTokens.KMS.decrypt_token("YjlmMWU0NmQtYTYwZC00NmEzLTg3ZDgtN2U3YTcyNmNhODM4gitXS8Jh9rIuR0DXnhosy2cKEB+Tf6marKZIyY1pc7PC/fAB4JDpQoWIZfEe2zP744Y4pq0BLkT/8ZGuBlf8PC8yz/tAbFQAhsCCvHwRpD8=")
%ExAws.Operation.JSON{
  stream_builder: nil,
  http_method: :post,
  parser: &Function.identity/1,
  error_parser: &Function.identity/1,
  path: "/",
  data: %{
    "Action" => "Decrypt",
    "CiphertextBlob" => "YjlmMWU0NmQtYTYwZC00NmEzLTg3ZDgtN2U3YTcyNmNhODM4gitXS8Jh9rIuR0DXnhosy2cKEB+Tf6marKZIyY1pc7PC/fAB4JDpQoWIZfEe2zP744Y4pq0BLkT/8ZGuBlf8PC8yz/tAbFQAhsCCvHwRpD8=",
    "Version" => "2014-11-01"
  },
  params: %{},
  headers: [
    {"x-amz-target", "TrentService.Decrypt"},
    {"content-type", "application/x-amz-json-1.0"}
  ],
  service: :kms,
  before_request: nil
}
{:ok,
 %{
   "KeyId" => "arn:aws:kms:us-east-1:000000000000:key/b9f1e46d-a60d-46a3-87d8-7e7a726ca838",
   "Plaintext" => "ZiA6vRY+UXZueCGl8cl3NVAkVq+RXiEfeulTdS47E+k="
 }}
iex(27)> Base.encode64(token)
"ZiA6vRY+UXZueCGl8cl3NVAkVq+RXiEfeulTdS47E+k="
iex(28)> Base.encode64(token) == "ZiA6vRY+UXZueCGl8cl3NVAkVq+RXiEfeulTdS47E+k="
true
```