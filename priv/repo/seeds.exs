# Script for populating the database. You can run it as=>
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly=>
#
#     Api.Repo.insert!(%Api.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Api.Newsletters
alias Faker
alias DateTime
alias Api.Templates

IO.puts("Start creating templates")
template1 = File.read!("priv/repo/base_template_v1.html")
# IO.inspect(String.first())
Templates.create_template(%{"name" => "Newsletter v1", "content" => template1})
IO.puts("End creating templates")

IO.puts("Start adding newsletters")

Newsletters.create_newsletter(%{
  "rawContent" => Faker.Markdown.markdown(),
  "publish_date" => DateTime.add(DateTime.utc_now(), -60, :second),
  "name" => "Issue 1",
  "htmlContent" => ""
})

Newsletters.create_newsletter(%{
  "rawContent" => Faker.Markdown.markdown(),
  "publish_date" => DateTime.add(DateTime.utc_now(), 61, :second),
  "name" => "Issue 2",
  "htmlContent" => ""
})

IO.puts("End adding newsletters")
