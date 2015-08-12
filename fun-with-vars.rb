require 'open-uri'

remote_base_url = "https://en.wikipedia.org/wiki"
remote_page_name = "Ada_Lovelace"
remote_full_url = remote_base_url + "/" + remote_page_name

puts "Downloading from: " + remote_full_url

remote_data = open(remote_full_url).read

local_file = 'local_version_of-' + remote_page_name + '.html'

puts "Writing to: " + local_file

local_file = open(local_file, 'w')
  local_file.write(remote_data)
local_file.close

read_file = open(local_file, 'r')
  puts read_file.read
read_file.close