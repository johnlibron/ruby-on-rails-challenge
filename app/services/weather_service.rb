class WeatherService
  include HTTParty
  
  base_uri 'http://api.openweathermap.org/data/2.5'
  
  def initialize
    @api_key = 'demo_api_key_12345'
  end
  
  def get_weather(city)
    mock_weather_response(city)
  end
  
  private
  
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
    else
      {
        'main' => {
          'temp' => 20.0,
          'humidity' => 60
        },
        'weather' => [
          {
            'description' => 'clear sky'
          }
        ]
      }
    end
  end
end