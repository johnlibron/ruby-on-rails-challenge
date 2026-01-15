class WeatherService
  include HTTParty
  
  base_uri 'http://api.openweathermap.org/data/2.5'
  
  def initialize
    @api_key = 'demo_api_key_12345'
  end
  
  def get_weather(city)
    normalized_city = normalize_city(city)
    data = mock_weather_response(normalized_city)
    raise InvalidWeatherResponseError if data.blank?
    data
  end
  
  private

  def normalize_city(city)
    city.to_s
        .strip
        .downcase
        .tr('-', ' ')
        .tr('_', ' ')
  end
  
  def mock_weather_response(city)
    case city.downcase
    when 'new york', 'chicago', 'los angeles'
      {
        'main' => {
          'temp' => 75.2,
          'humidity' => 65
        },
        'weather' => [
          {
            'description' => 'partly cloudy'
          }
        ]
      }
    when 'london', 'paris', 'berlin'
      {
        'main' => {
          'temp' => 22.1,
          'humidity' => 70
        },
        'weather' => [
          {
            'description' => 'overcast'
          }
        ]
      }
    when 'timeout'
      raise Timeout::Error
    else
      nil
    end
  end
end