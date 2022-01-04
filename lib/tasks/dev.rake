namespace :dev do
  desc "Configure the development environment"
  task setup: :environment do
    puts %x(rails db:drop)
    puts %x(rails db:create)
    puts %x(rails db:migrate)
    puts %x(rails db:seed)
  end

end
