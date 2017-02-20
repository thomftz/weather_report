# WU API KEY: 1c2da1726f88effd
require 'pry'
require 'HTTParty'
require 'json'
require_relative '../lib/in_memory_cache'
require_relative '../lib/weather_report'

def main

puts "Please enter a zip_code"
WeatherReport.new.ten_day_forecast(gets.to_i)


end
main if __FILE__ == $PROGRAM_NAME
