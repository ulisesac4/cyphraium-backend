defmodule ApiWeb.NewsletterView do
  use ApiWeb, :view
  alias ApiWeb.NewsletterView

  def render("index.json", %{newsletters: newsletters}) do
    %{data: render_many(newsletters, NewsletterView, "newsletter.json")}
  end

  def render("show.json", %{newsletter: newsletter}) do
    %{data: render_one(newsletter, NewsletterView, "newsletter.json")}
  end

  def render("newsletter.json", %{newsletter: newsletter}) do
    %{
      id: newsletter.id,
      rawContent: newsletter.rawContent,
      htmlContent: newsletter.htmlContent,
      name: newsletter.name,
      publish_date: newsletter.publish_date,
      inserted_at: newsletter.inserted_at
    }
  end
end
