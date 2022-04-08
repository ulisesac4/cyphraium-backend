defmodule ApiWeb.TemplateControllerTest do
  use ApiWeb.ConnCase

  import Api.TemplatesFixtures

  alias Api.Templates.Template

  @create_attrs %{
    content: "some content",
    name: "some name"
  }
  @update_attrs %{
    content: "some updated content",
    name: "some updated name"
  }
  @invalid_attrs %{content: nil, name: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all templates", %{conn: conn} do
      conn = get(conn, Routes.template_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create template" do
    test "renders template when data is valid", %{conn: conn} do
      conn = post(conn, Routes.template_path(conn, :create), template: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.template_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "content" => "some content",
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.template_path(conn, :create), template: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update template" do
    setup [:create_template]

    test "renders template when data is valid", %{conn: conn, template: %Template{id: id} = template} do
      conn = put(conn, Routes.template_path(conn, :update, template), template: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.template_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "content" => "some updated content",
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, template: template} do
      conn = put(conn, Routes.template_path(conn, :update, template), template: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete template" do
    setup [:create_template]

    test "deletes chosen template", %{conn: conn, template: template} do
      conn = delete(conn, Routes.template_path(conn, :delete, template))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.template_path(conn, :show, template))
      end
    end
  end

  defp create_template(_) do
    template = template_fixture()
    %{template: template}
  end
end
