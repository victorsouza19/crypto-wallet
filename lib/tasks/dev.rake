require 'tty-spinner'

namespace :dev do
  desc "Configure the development environment"
  task setup: :environment do

    if Rails.env.development?
      spinner = TTY::Spinner.new("[:spinner] Deleting database...", format: :pulse_2)
      spinner.auto_spin
      %x(rails db:drop)
      spinner.success()

      spinner = TTY::Spinner.new("[:spinner] Creating database...", format: :pulse_2)
      spinner.auto_spin
      %x(rails db:create)
      spinner.success()

      spinner = TTY::Spinner.new("[:spinner] Executing migrates...", format: :pulse_2)
      spinner.auto_spin
      %x(rails db:migrate)
      spinner.success()

      spinner = TTY::Spinner.new("[:spinner] Seed database...", format: :pulse_2)
      spinner.auto_spin
      %x(rails db:seed)
      spinner.success('Done!')
 
    else
      puts "You aren't in the development environment!"
    end
  end

end