namespace :dev do
  desc "Configure the development environment"
  task setup: :environment do

    if Rails.env.development?
      puts %x(rails db:drop)
      puts %x(rails db:create)
      puts %x(rails db:migrate)
      puts %x(rails db:seed)
    else
      puts "You aren't in the development environment!"
    end
  end

end
