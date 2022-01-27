module ApplicationHelper
  def date_br(date_us)
    date_us.strftime("%d/%m/%Y")
  end  

  def getLocale(locale)
    locale == :en ? "USA" : "Brazil"
  end

end
