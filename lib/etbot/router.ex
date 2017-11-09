defmodule Etbot.Router do
  use Plug.Router

  if Mix.env == :dev do
    use Plug.Debugger
  end

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    json_decoder: Poison

  plug :match
  plug :dispatch

  get "/" do
    conn
      |> put_resp_content_type("text/plain")
      |> send_resp(200, "ok")
  end

  post "/wh" do
    result = "ok"
    conn
      |> put_resp_content_type("application/json")
      |> send_resp(201, result)
  end

  match _ do
    send_resp(conn, 404, "Page not found!")
  end
end
