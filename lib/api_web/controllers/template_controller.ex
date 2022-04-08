defmodule ApiWeb.TemplateController do
  use ApiWeb, :controller

  alias Api.Templates
  alias Api.Templates.Template

  action_fallback ApiWeb.FallbackController

  def index(conn, _params) do
    templates = Templates.list_templates()
    render(conn, "index.json", templates: templates)
  end

  def create(conn, %{"template" => template_params}) do
    with {:ok, %Template{} = template} <- Templates.create_template(template_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.template_path(conn, :show, template))
      |> render("show.json", template: template)
    end
  end

  def show(conn, %{"id" => id}) do
    template = Templates.get_template!(id)
    render(conn, "show.json", template: template)
  end

  def update(conn, %{"id" => id, "template" => template_params}) do
    template = Templates.get_template!(id)

    with {:ok, %Template{} = template} <- Templates.update_template(template, template_params) do
      render(conn, "show.json", template: template)
    end
  end

  def delete(conn, %{"id" => id}) do
    template = Templates.get_template!(id)

    with {:ok, %Template{}} <- Templates.delete_template(template) do
      send_resp(conn, :no_content, "")
    end
  end
end
