require "selenium-webdriver"
require "csv"
require "watir"

b = Watir::Browser.new :firefox

count=1;

csv_text = File.read('list.csv')
csv = CSV.parse(csv_text, :headers => true)
sleep 7


 
csv.each do |row|  
sleep 4
loc1= "#{row['url_old']}"
loc2= "#{row['url_new']}"
b.goto loc1
sleep 5
url_return = b.url
puts  url_return

if (loc2!=url_return)
    puts count
    puts "Found a mismatch  for column B "<<loc2<<" and "<<url_return
    count+=1;



end

end