require 'HTTParty'
require 'pry'
require_relative 'in_memory_cache'

class WeatherReport
  @cache = InMemoryCache.new

  def ten_day_forecast(zip_code)
    api_call = HTTParty.get("http://api.wunderground.com/api/1c2da1726f88effd/forecast10day/q/#{zip_code}.json")

    json_data = JSON.parse(api_call.body)
    forecast_parser = json_data['forecast']['txt_forecast']['forecastday']
    ten_day = forecast_parser.map {|w| [w['title'], w['fcttext']]}

    # @cache.set(zip_code, ten_day)
    puts ten_day

    # puts @cache['title']
  end
end

# class WeatherReport
#   include HTTParty
#   base_uri 'medium-crossover.herokuapp.com'
#
#   def initialize(api)
#     @options = { query: { site: api} }
#   end
#
#   def users
#     self.class.get("/users?search=asdf", @options)
#   end
#
#   def posts
#     self.class.get("/posts", @options)
#   end
# end
#
#
#
# weather_report = WeatherReport.new("medium-crossover.herokuapp.com")
# puts weather_report.users
# puts weather_report.posts
