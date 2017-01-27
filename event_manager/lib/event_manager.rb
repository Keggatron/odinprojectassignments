

require 'csv'  
require 'sunlight/congress'
require 'erb'

Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

def clean_zipcode(zipcode)  
    zipcode.to_s.rjust(5,"0")[0..4]
end
    # that line just cleaned up all of this code:
    
=begin    if zipcode.nil?
        zipcode == "00000"
    elsif zipcode.length < 5
        zipcode = zipcode.rjust 5, "0"
    elsif zipcode.length > 5
        zipcode = zipcode[0..4]
=end    end

def legislators_by_zipcode(zipcode)
    Sunlight::Congress::Legislator.by_zipcode(zipcode)
end

def save_thank_you_letters(id, form_letter)
    Dir.mkdir("output") unless Dir.exists?("output")
    
    filename = "output/thanks_#{id}.html"
    
    File.open(filename, 'w'){|file| file.puts form_letter}
end

puts "EventManager Initialized"

contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol

template_letter = File.read "form_letter.erb"
erb_template = ERB.new template_letter

contents.each {|row|
    id = row[0]
    name = row[:first_name]
    
    zipcode = clean_zipcode(row[:zipcode])
    
    legislators = legislators_by_zipcode(zipcode)
    
    form_letter = erb_template.result(binding)
    
    save_thank_you_letters(id,form_letter)
    
}    





