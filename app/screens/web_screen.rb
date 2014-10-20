class WebScreen < PM::WebScreen
  title "网站"

  attr_accessor :url

  def content
    NSURL.URLWithString(@url)
  end
  
end