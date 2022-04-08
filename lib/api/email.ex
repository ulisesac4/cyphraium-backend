defmodule Api.Email do
  alias Mailchimp
  alias Api.Templates
  alias HTTPoison

  def get_all_lists() do
    Mailchimp.Account.get() |> elem(1) |> Mailchimp.Account.lists()
  end

  def get_all_contacts_from_a_list(list) do
    Mailchimp.List.members(list, %{})
  end

  def send_newsletter_to_cyphraium(content) do
    list =
      get_all_lists()
      |> elem(1)
      |> Enum.find(fn element -> element.name === "Cyphraium" end)

    template = Templates.upload_to_mailchimp(content.name, content.htmlContent) |> elem(1)

    campaign =
      Mailchimp.Campaign.create(:regular, %{
        recipients: %{list_id: list.id},
        settings: %{
          from_name: "Cyphraium",
          reply_to: "info@cyphraium.com",
          title: content.name,
          subject_line: content.name,
          template_id: template.id
        }
      })
      |> elem(1)

    HTTPoison.post(
      "#{Application.get_env(:api, :mailchimp_api_base_url)}/campaigns/#{campaign.id}/actions/send",
      "{}",
      [
        {"Authorization", "Basic #{Application.get_env(:mailchimp, :api_key)}"}
      ]
    )
  end
end
