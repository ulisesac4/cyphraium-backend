defmodule ApiWeb.AuthContent do
  import Plug.Conn

  use ApiWeb, :controller

  def init(opts), do: opts

  def call(conn, _opts) do
    # coming soon!

    header = Plug.Conn.get_req_header(conn, "authorization")

    case Kernel.length(header) do
      0 ->
        # render(conn, "unauthorized.json", "")
        Phoenix.Controller.put_view(conn, ApiWeb.NewsletterView)
        |> Phoenix.Controller.render("unauthorized.json", %{})
        |> halt()

      1 ->
        # List.first(header) #|> String.split(" ")
        token = List.first(header) |> String.split() |> Enum.at(1)

        bearer_token = Application.get_env(:api, :auth_token)

        case token do
          ^bearer_token ->
            conn

          _ ->
            # render(conn, "unauthorized.json", "")
            Phoenix.Controller.put_view(conn, ApiWeb.NewsletterView)
            |> Phoenix.Controller.render("unauthorized.json", %{})
            |> halt()
        end
    end
  end
end
