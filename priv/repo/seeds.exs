# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Api.Repo.insert!(%Api.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Api.Newsletters
alias Faker

Newsletters.create_newsletter(%{
  rawContent: Faker.Markdown.markdown(),
  publish_date:
    Faker.DateTime.between(
      DateTime.from_iso8601("2022-02-20T00:00:00Z") |> elem(1),
      DateTime.from_iso8601("2022-02-28T23:50:07Z") |> elem(1)
    ),
  name: "Issue 1"
})

Newsletters.create_newsletter(%{
  rawContent: Faker.Markdown.markdown(),
  publish_date:
    Faker.DateTime.between(
      DateTime.from_iso8601("2022-02-20T00:00:00Z") |> elem(1),
      DateTime.from_iso8601("2022-02-28T23:50:07Z") |> elem(1)
    ),
  name: "Issue 2"
})

Newsletters.create_newsletter(%{
  rawContent: Faker.Markdown.markdown(),
  publish_date:
    Faker.DateTime.between(
      DateTime.from_iso8601("2022-02-20T00:00:00Z") |> elem(1),
      DateTime.from_iso8601("2022-02-28T23:50:07Z") |> elem(1)
    ),
  name: "Issue 3"
})

Newsletters.create_newsletter(%{
  rawContent: Faker.Markdown.markdown(),
  publish_date:
    Faker.DateTime.between(
      DateTime.from_iso8601("2022-02-20T00:00:00Z") |> elem(1),
      DateTime.from_iso8601("2022-02-28T23:50:07Z") |> elem(1)
    ),
  name: "Issue 4"
})

Newsletters.create_newsletter(%{
  rawContent: Faker.Markdown.markdown(),
  publish_date:
    Faker.DateTime.between(
      DateTime.from_iso8601("2022-02-20T00:00:00Z") |> elem(1),
      DateTime.from_iso8601("2022-02-28T23:50:07Z") |> elem(1)
    ),
  name: "Issue 5"
})
