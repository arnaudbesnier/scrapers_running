require 'json'
require 'open-uri'
require 'nokogiri'
require "csv"

SITE_URL = "www.runnerbreizh.fr"
data = File.read('runners.json')
runners = JSON.parse(data)

CSV_HEADER = ['last_name', 'first_name', 'date', 'race', 'city', 'department', 'distance', 'position', 'indice', 'performance', 'time_per_km', 'race_type', 'position_per_category']
performances = []

# NOTICE: Retrieve all runners performances
runners.each do |runner|
  link = "http://#{SITE_URL}/coureur.php?CoureurNom=#{runner['last_name']}&CoureurPrenom=#{runner['first_name']}"
  puts " == Retrieving #{runner['first_name']} #{runner['last_name']} performances... (#{link})"

  doc = Nokogiri::HTML(open(link))

  doc.css('table.tableau-courses').each do |table|
    # NOTICE: Detect the right table in the page
    if table['cellpadding'] == '3' && table['style'] == 'width:auto; text-align:left'
      table.css('tr').each_with_index do |line, index|
        # NOTICE: Bypass the first two line of the array
        if index > 1
          performance = [runner['last_name'], runner['first_name']]
          line.css('td').each do |column|
            performance << column.content
          end
          performances << performance
        end
      end
    end
  end
end

# NOTICE: Generate the CSV file.
CSV.open('performances.csv', 'wb') do |csv|
  csv << CSV_HEADER
  performances.each do |performance|
    csv << performance
  end
end
