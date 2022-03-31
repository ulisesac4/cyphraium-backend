defmodule ApiWeb.NewsletterController do
  use ApiWeb, :controller

  alias Api.Newsletters
  alias Api.Newsletters.Newsletter
  alias Api.Schedulers

  action_fallback ApiWeb.FallbackController

  def index(conn, _params) do
    newsletters = Newsletters.list_newsletters()
    render(conn, "index.json", newsletters: newsletters)
  end

  def create(conn, %{"newsletter" => newsletter_params}) do
    with {:ok, %Newsletter{} = newsletter} <- Newsletters.create_newsletter(newsletter_params) do
      Schedulers.newsletter_boosttrap()

      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.newsletter_path(conn, :show, newsletter))
      |> render("show.json", newsletter: newsletter)
    end
  end

  def show(conn, %{"id" => id}) do
    newsletter = Newsletters.get_newsletter!(id)
    render(conn, "show.json", newsletter: newsletter)
  end

  def update(conn, %{"id" => id, "newsletter" => newsletter_params}) do
    newsletter = Newsletters.get_newsletter!(id)

    with {:ok, %Newsletter{} = newsletter} <-
           Newsletters.update_newsletter(newsletter, newsletter_params) do
      render(conn, "show.json", newsletter: newsletter)
    end
  end

  def delete(conn, %{"id" => id}) do
    newsletter = Newsletters.get_newsletter!(id)

    with {:ok, %Newsletter{}} <- Newsletters.delete_newsletter(newsletter) do
      send_resp(conn, :no_content, "")
    end
  end
end
