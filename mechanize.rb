require 'rubygems'
require 'mechanize'
require 'nokogiri'

cspo_number = '51035'
full_remote_url = 'http://www.cpso.on.ca/Public-Register/doctor-details.aspx?view=1&id=%20' + cspo_number

agent = Mechanize.new

puts 'Downloading from: ' + full_remote_url + ' ...'

doctor_profile = agent.get(full_remote_url)

profile_details = doctor_profile.search('div#profile-content')

doctor_info_file = "doctor-" + cspo_number + '.xml'

file = Nokogiri::XML(File.open(doctor_info_file, 'w') do |f|
  f.write(profile_details))
end

# File.open(doctor_info_file, 'w') do |f|
#   f.write(profile_details)
# end
