defmodule PrivateTokensWeb.PageController do
  use PrivateTokensWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
