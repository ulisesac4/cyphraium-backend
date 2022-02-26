defmodule ApiWeb.NewsletterControllerTest do
  use ApiWeb.ConnCase

  import Api.NewslettersFixtures

  alias Api.Newsletters.Newsletter

  @create_attrs %{
    htmlContent: "some htmlContent",
    name: "some name",
    publish_date: ~U[2022-02-25 22:02:00Z],
    rawContent: "some rawContent"
  }
  @update_attrs %{
    htmlContent: "some updated htmlContent",
    name: "some updated name",
    publish_date: ~U[2022-02-26 22:02:00Z],
    rawContent: "some updated rawContent"
  }
  @invalid_attrs %{htmlContent: nil, name: nil, publish_date: nil, rawContent: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all newsletters", %{conn: conn} do
      conn = get(conn, Routes.newsletter_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create newsletter" do
    test "renders newsletter when data is valid", %{conn: conn} do
      conn = post(conn, Routes.newsletter_path(conn, :create), newsletter: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.newsletter_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "htmlContent" => "some htmlContent",
               "name" => "some name",
               "publish_date" => "2022-02-25T22:02:00Z",
               "rawContent" => "some rawContent"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.newsletter_path(conn, :create), newsletter: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update newsletter" do
    setup [:create_newsletter]

    test "renders newsletter when data is valid", %{conn: conn, newsletter: %Newsletter{id: id} = newsletter} do
      conn = put(conn, Routes.newsletter_path(conn, :update, newsletter), newsletter: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.newsletter_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "htmlContent" => "some updated htmlContent",
               "name" => "some updated name",
               "publish_date" => "2022-02-26T22:02:00Z",
               "rawContent" => "some updated rawContent"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, newsletter: newsletter} do
      conn = put(conn, Routes.newsletter_path(conn, :update, newsletter), newsletter: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete newsletter" do
    setup [:create_newsletter]

    test "deletes chosen newsletter", %{conn: conn, newsletter: newsletter} do
      conn = delete(conn, Routes.newsletter_path(conn, :delete, newsletter))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.newsletter_path(conn, :show, newsletter))
      end
    end
  end

  defp create_newsletter(_) do
    newsletter = newsletter_fixture()
    %{newsletter: newsletter}
  end
end
