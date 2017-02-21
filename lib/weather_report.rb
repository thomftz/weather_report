# require 'HTTParty'
require 'pry'
require_relative 'in_memory_cache'
require 'open-uri'

class WeatherReport

  def current_forecast(zip_code)
    open("http://api.wunderground.com/api/1c2da1726f88effd/geolookup/conditions/q/#{zip_code}.json") do |f|
      json_string = f.read
      parsed_json = JSON.parse(json_string)
      location = parsed_json['location']['city']
      temp_f = parsed_json['current_observation']['temp_f']
      print "Current temperature in #{location} is: #{temp_f}\n"
    end
  end

  def ten_day_forecast(zip_code)
    open("http://api.wunderground.com/api/1c2da1726f88effd/forecast10day/q/#{zip_code}.json") do |f|
      json_string = f.read
      parsed_json = JSON.parse(json_string)
      ten_day = parsed_json['forecast']['txt_forecast']['forecastday'].map {|w| [w['title'], w['fcttext']]}
      ten_day.each do |row|
        print "The forecast on #{row}\n"
      end
    end
  end


  def sun_rise_sun_set(zip_code)
    open("http://api.wunderground.com/api/1c2da1726f88effd/astronomy/q/#{zip_code}.json") do |f|
      json_string = f.read
      parsed_json = JSON.parse(json_string)
      sunrise = parsed_json['sun_phase']['sunrise']
      sunset = parsed_json['sun_phase']['sunset']
      print "Today's sunrise is at #{sunrise} and the sunset will be: #{sunset}\n"
    end
  end




  def exit_program(decision)
    if decision == 'exit'
      exit
    end
  end

end
