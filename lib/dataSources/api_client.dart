import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import 'package:weatherapp/models/weather_response.dart';

part 'api_client.g.dart';

final client = ApiClient(Dio());

@RestApi(baseUrl: 'https://api.openweathermap.org/data/2.5/')
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("/weather")
  Future<WeatherResponse> getWeatherForCity(
      @Query('q')
      String cityName,
      @Query('lang')
      String language,
      @Query('units')
      String units,
      @Query('appid')
      String apiKey);
}