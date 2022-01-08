require 'tty-spinner'

namespace :dev do
  desc "Configure the development environment"
  task setup: :environment do

    if Rails.env.development?
      show_spinner("Deleting database") { %x(rails db:drop) }
      show_spinner("Creating database") { %x(rails db:create) }
      show_spinner("Executing migrates") { %x(rails db:migrate) }
      %x(rails dev:add_coins)
      %x(rails dev:add_mining_types)
      show_spinner("Finishing") {}
    else
      puts "You aren't in the development environment!"
    end
  end

  desc "Create coins"
  task add_coins: :environment do

    show_spinner("Creating coins") do
      coins = 
      [
        {
          title: "Bitcoin",
          acronym: "BTC",
          url_image: "https://s2.coinmarketcap.com/static/img/coins/64x64/1.png"
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
        },
        {
          title: "Tether",
          acronym: "USDT",
          url_image: "https://s2.coinmarketcap.com/static/img/coins/64x64/825.png"
        },
        {
          title: "Solana",
          acronym: "SOL",
          url_image: "https://s2.coinmarketcap.com/static/img/coins/64x64/5426.png"
        }
      ]

      coins.each do |coin|
        Coin.find_or_create_by!(coin)
      end
    end
  end

  desc "Create mining types"
  task add_mining_types: :environment do

    show_spinner("Creating mining types") do
      types = 
      [
        {
          description: "Proof of Work",
          acronym: "PoW",
        },
        {
          description: "Proof of Stake",
          acronym: "PoS",
        },
        {
          description: "Proof of Capacity",
          acronym: "PoC",
        },
      ]

      types.each do |type|
        MiningType.find_or_create_by!(type)
      end
    end
  end

  private 
    def show_spinner(start_msg, end_msg = nil)
      spinner = TTY::Spinner.new("[:spinner] #{start_msg}...", format: :pulse_2)
      spinner.auto_spin

      yield

      if end_msg != nil
        spinner.success("#{end_msg}")
      else
        spinner.success()
      end
    end
end