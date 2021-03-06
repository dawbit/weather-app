import 'package:weatherapp/dataSources/api_client.dart';
import 'package:weatherapp/models/weather_response.dart';

const String units = 'metric';
const String lang = 'en';
const String apiKey = '2121bdef55d2ebe6dae0ec9dfaa4e254';

class WeatherRepository {
  Future<WeatherResponse> getWeatherForCity(String city) => client.getWeatherForCity(city, lang, units, apiKey);
}
