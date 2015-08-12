require 'rubygems'
require 'mechanize'
require 'nokogiri'

# Format the URL to query
cpso_number = '68216'
remote_url = 'http://www.cpso.on.ca/Public-Register/doctor-details.aspx?view=1&id=%20' + cpso_number

# Instantiate a Mechanize crawler
agent = Mechanize.new

# Get the doctor profile page data
profile_page = agent.get(remote_url)
profile_page_data = profile_page.search('div#profile-content')

# Divide the profile page data into manageable chunks
data_to_parse = []
profile_page_data.xpath('//p').each do |node|
  element = node.text
  data_to_parse << element
end

# Parse the relevant chunks to get clean data
def get_first_name(arr)
  given_name = arr[2].gsub(/[\n\r\t]/, "").match(/Given Name:(.+?)Surname/)
  first_name = given_name[1].strip.gsub(/\u00A0/, "")
end

def get_last_name(arr)
  surname = arr[2].gsub(/[\n\r\t]/, "").match(/Surname:(.+?)Former/)
  last_name = surname[1].strip.gsub(/\u00A0/, "")
end

def get_phone_number(arr)
  number = arr[3].gsub(/[\n\r\t\s]/, "").match(/Phone:(.+?)Fax:/)
  phone_number = number[1].strip.gsub(/\u00A0/, "")
end

# Take the clean data and organize it as a hash
doctor_info = {
  "First Name" => get_first_name(data_to_parse),
  "Last Name" => get_last_name(data_to_parse),
  "Phone Number" => get_phone_number(data_to_parse)
}

# Sanity check
puts "Full Name: " + get_first_name(data_to_parse) + " " + get_last_name(data_to_parse)
puts "Office Phone Number: " + get_phone_number(data_to_parse)
puts doctor_info

# Create the filename
doctor_info_file_name = 'doctor-' + cpso_number + '.xml'

# Output the cleaned and organized info in a file
file = File.open(doctor_info_file_name, 'w')
  file.write(doctor_info)
file.close