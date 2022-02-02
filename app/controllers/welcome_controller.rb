class WelcomeController < ApplicationController
  def index
    cookies[:course] = "Ruby on Rails (:"
    session[:username] = "Victor Souza"
    @my_name = params[:name]
  end
end
