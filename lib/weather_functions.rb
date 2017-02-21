def weather_report(zip_code)
  option = ''

  unless option == '6'
    puts ' '
    puts 'Please enter a number for:'
    puts '(1). Current conditions'
    puts '(2). 10 day forecast'
    puts '(3). Sunrise and sunset times'
    puts '(4). Current weather alerts'
    puts '(5). A list of all active hurricanes (anywhere)'
    puts '(6). To Exit'
    puts '----------------------------------'
    option = gets.chomp
  end
  choices = {current_forecast: '1', ten_day_forecast: '2', sun_rise_sun_set: '3', alerts: '4', hurricanes: '5', exit: '6'}
  decision = choices.key(option).to_s

  case decision
    when decision = 'current_forecast'
      WeatherReport.new.current_forecast(zip_code)
    when decision = 'ten_day_forecast'
      WeatherReport.new.ten_day_forecast(zip_code)
    when decision = 'sun_rise_sun_set'
      WeatherReport.new.sun_rise_sun_set(zip_code)
    when decision = 'alerts'
      WeatherReport.new.alerts(zip_code)
    when decision = 'hurricanes'
      WeatherReport.new.hurricanes(zip_code)
    when decision = 'exit_program'
      WeatherReport.new.exit_program(decision)
    end
end
