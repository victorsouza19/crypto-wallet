# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

spinner = TTY::Spinner.new("[:spinner] Creating coins...", format: :pulse_2)
spinner.auto_spin

coins = 
  [
    {
      title: "Bitcoin",
      acronym: "BTC",
      url_image: "https://logosmarcas.net/wp-content/uploads/2020/08/Bitcoin-Logo.png"
    },
    {
      title: "Ethereum",
      acronym: "ETH",
      url_image: "https://www.ceiconsultoria.com.br/wp-content/uploads/ethereum.png"
    },
    {
      title: "Dash",
      acronym: "DASH",
      url_image: "https://cryptologos.cc/logos/dash-dash-logo.png"
    },
    {
      title: "Dogecoin",
      acronym: "DOGE",
      url_image: "https://bitpreco.com/assets/img/coins/dogecoin/bitpreco-moeda-dogecoin.svg"
    }
  ]

  coins.each do |coin|
    Coin.find_or_create_by!(coin)
  end

spinner.success('Done!')