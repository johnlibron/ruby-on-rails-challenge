class Api::V1::WeatherController < Api::V1::BaseController
  def show
    city = params[:city]
    
    begin
      weather_data = WeatherService.new.get_weather(city)
      
      temperature = weather_data['main']['temp']
      
      is_us_city = '%w[new york chicago los angeles]'.include?(city.downcase)

      temp_celsius = is_us_city ? fahrenheit_to_celsius(temperature) : temperature

      render json: {
        city: city,
        temperature_celsius: temp_celsius.round(1),
        temperature_fahrenheit: celsius_to_fahrenheit(temp_celsius).round(1),
        description: weather_data['weather'][0]['description'],
        humidity: weather_data['main']['humidity']
      }
    rescue InvalidWeatherResponseError
      render json: { error: 'Invalid weather data received' }, status: :bad_gateway
    rescue Timeout::Error
      render json: { error: 'Weather service unavailable' }, status: :service_unavailable
    end
  end
  
  private
  
  def celsius_to_fahrenheit(celsius)
    (celsius * 9/5) + 32
  end

  def fahrenheit_to_celsius(f)
    (f - 32) * 5.0 / 9
  end
end