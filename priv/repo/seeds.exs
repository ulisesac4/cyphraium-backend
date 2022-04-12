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
  "campaignName" => "Issue 1",
  "htmlContent" => "",
  "name" =>
    "Issue 1, Suspension in Rusia and India, NFTs start to go to the food industry, Problems with crypto carbon footprint",
  "publish_date" => "2022-04-09T04:30:00Z",
  "rawContent" =>
    "\nWelcome to Cyphraium's Newsletter\n\nThis is Issue 1 of this newsletter, the very first one I hope you enjoy it!\n\n## General News\n\n### [Russian Finance Ministry Amends Bill \u2018On Digital Currency,\u2019 Adds Crypto Mining Provisions \u2013 Mining Bitcoin News](https://news.bitcoin.com/russian-finance-ministry-amends-bill-on-digital-currency-adds-crypto-mining-provisions/)\n\nMinistry of Finance has revised a draft law designed to regulate the country's crypto space. Update includes provisions for cryptocurrency mining. The bill has been resubmitted to the government and may be adopted during the spring session. Russia's Goverment aims to regulate instead of baning crypto activities.\n\n### [HBAR Foundation Launches $250 Million Metaverse Fund to Entice Developers to Build on Hedera ](https://news.bitcoin.com/hbar-foundation-launches-250-million-metaverse-fund-to-entice-developers-to-build-experiences-on-hedera/)\n\nHBAR foundation has announced the launch of a new Metaverse fund. The fund, which launches with $250 million, will entice builders and programmers to bring their metaverse products to the Hedera network. It will offer incentives for these experiences to be built using its infrastructures. \n\n### [EU Bans High-Value Crypto Services to Russia in New Round of Sanctions ](https://news.bitcoin.com/eu-bans-high-value-crypto-services-to-russia-in-new-round-of-sanctions/)\n\nEU limits Russian Crypto Wallet Deposits to \u20ac10,000. New sanctions prohibit the provision of \"high-value\" crypto-asset services. EU measures also ban the sale of banknotes and transferrable securities denominated in euro or other currencies to Russia and Belarus.\n\n### [Coinbase suspends crypto payment services days after India launch](https://cointelegraph.com/news/coinbase-suspends-crypto-payment-services-days-after-india-launch)\n\nCoinbase has stopped payment services through United Payments Interface (UPI) on its platform for Indian users.  Co-founder of the Crypto India YouTube channel Aditya Singh tweeted: \"Crypto India has also been facing payment service problems since 2018\".\n\n### [The Biggest Crypto Effort to End Useless Carbon Offsets Is Backfiring](https://www.bloomberg.com/news/articles/2022-04-07/the-biggest-crypto-effort-to-end-useless-carbon-offsets-is-backfiring)\n\nCrypto users account for more than a quarter of all carbon credits purchased by the world's largest verifier of offsets. A project funded through offsets could, for example, support the building of renewable energy plant. The Dayingjiang-3 hydropower dam in China's Yunnan province sold its first carbon credit in December. \n\n### [The Global Restaurant Brand With The Million Dollar NFT Membership Club (Video)](https://www.forbes.com/video/6302465777001/the-global-restaurant-brand-with-the-million-dollar-nft-membership-club/)\n\nAs NFTs infiltrate every industry from art to music to real estate, it was only a matter of time before they broke into the food and hospitality sector.\n\n## Projects\n\n### [Bancor Protocol Contracts v3.0 (Dawn Release)](https://github.com/bancorprotocol/contracts-v3)\n\nBancor is a decentralized trading and yield protocol. Supports instant token-to-token trades, single-sided liquidity provision, auto-compounding rewards and loss protection for any listed asset.\n\nThe Dawn release includes the following features:\n\n* Token to token trades\n* Instant IL protection\n* Single-sided Liquidity Provision\n* Omnipool\n* Infinity Pools\n* Auto-compounding Rewards\n* Dual Rewards\n* Third Party IL Protection\n* Composable Pool Tokens\n* Tokenomics Redesign\n*Flash Loans\n\n*If you want to Sponsor us do not forget to check how to do it in [Sponsoring us](https://cyphraium.com/newsletter/sponsor)*\n"
})

IO.puts("End adding newsletters")
