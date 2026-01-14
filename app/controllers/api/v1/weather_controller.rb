class Api::V1::WeatherController < Api::V1::BaseController
  def show
    city = params[:city]
    
    begin
      weather_data = WeatherService.new.get_weather(city)
      
      temperature = weather_data['main']['temp']
      
      render json: {
        city: city,
        temperature_celsius: temperature,
        temperature_fahrenheit: celsius_to_fahrenheit(temperature),
        description: weather_data['weather'][0]['description'],
        humidity: weather_data['main']['humidity']
      }
    rescue => e
      render json: { error: "Weather service unavailable: #{e.message}" }, status: :service_unavailable
    end
  end
  
  private
  
  def celsius_to_fahrenheit(celsius)
    (celsius * 9/5) + 32
  end
end