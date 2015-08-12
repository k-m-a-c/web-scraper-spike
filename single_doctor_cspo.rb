require 'open-uri'

# Header Settings
ACCEPT = 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8'
ACCEPT_ENCODING = 'gzip, deflate, sdch'
ACCEPT_LANGUAGE = 'en-US,en;q=0.8'
CACHE_CONTROL = 'max-age=0'
CONNECTION = 'keep-alive'
COOKIE = 'CMSPreferredCulture=en-CA; __utmt=1; __utma=239283921.1093994054.1439314818.1439314818.1439314818.1; __utmb=239283921.1.10.1439314818; __utmc=239283921; __utmz=239283921.1439314818.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none)'
DNT = '1'
HOST = 'www.cpso.on.ca'
UPGRADE_INSECURE_REQUESTS = '1'
RUBY_USER_AGENT = "Ruby/2.2.1"
FAKE_USER_AGENT = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.125 Safari/537.36'

# Request URL
remote_base_url = 'http://www.cpso.on.ca/Public-Register/doctor-details.aspx?'
view_value = '1'
doctor_cspo_number = '68216'
query_string_parameters = 'view=' + view_value + '=' + 'id=%20' + doctor_cspo_number
full_remote_url = remote_base_url + query_string_parameters

puts 'Downloading from: ' + full_remote_url + ' ...'

# Request Headers
official_doctor_data = open(
  full_remote_url,
  "Accept" => ACCEPT,
  "Accept-Encoding" => ACCEPT_ENCODING,
  "Accept-Language" => ACCEPT_LANGUAGE,
  "Cache-Control" => CACHE_CONTROL,
  "Connection" => CONNECTION,
  "Cookie" => COOKIE,
  "DNT" => DNT,
  "Host" => HOST,
  "Upgrade-Insecure-Requests" => UPGRADE_INSECURE_REQUESTS,
  "User-Agent" => FAKE_USER_AGENT
  ).read

puts official_doctor_data

# local_file = 'local_version_of-' + doctor_cspo_number + '-profile' + '.html'

# puts 'Writing to: ' + local_file + ' ...'

# local_file.open(local_file, 'w')
#   local_file.write(official_doctor_data)
# local_file.close