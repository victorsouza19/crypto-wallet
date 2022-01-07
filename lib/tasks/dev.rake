require 'tty-spinner'

namespace :dev do
  desc "Configure the development environment"
  task setup: :environment do

    if Rails.env.development?
      show_spinner("Deleting database") { %x(rails db:drop) }
      show_spinner("Creating database") { %x(rails db:create) }
      show_spinner("Executing migrates") { %x(rails db:migrate) }
      show_spinner("Seed database", "Done!") { %x(rails db:seed) }
    else
      puts "You aren't in the development environment!"
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