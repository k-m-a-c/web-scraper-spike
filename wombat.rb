require 'wombat'

Wombat.crawl do
  base_url "http://www.cpso.on.ca/"
  path "Public-Register/doctor-details.aspx?view=1&id=%2051035"

  some_data css: "div#profile-content"
  puts some_data
end