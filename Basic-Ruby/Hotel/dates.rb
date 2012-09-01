require 'date'

def Date.get_formatted_date(date)
  current_year = Date.today.year
  temp_date = date + "-" + current_year.to_s
  if( Date.parse(temp_date) <= Date.today )
    temp_date = date + "-" + (current_year + 1).to_s
  end
  Date.parse(temp_date)
end

puts Date.get_formatted_date("28-12")
puts Date.get_formatted_date("01-05")
puts Date.get_formatted_date("01-06")
puts Date.get_formatted_date("31-07")