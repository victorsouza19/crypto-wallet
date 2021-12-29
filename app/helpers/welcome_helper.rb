module WelcomeHelper
  def check_environment

    if Rails.env.development?
      "Development"
    elsif Rails.env.production?
      "Production"
    else
      "Test"
    end
    
  end
end
