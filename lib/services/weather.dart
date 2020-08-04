import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/services.dart';

const apiKey = '';
const openWeatherMapUrl = 'https://samples.openweathermap.org/data/2.5/weather';

class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async {
    var url = '$openWeatherMapUrl?q=$cityName&appid=$apiKey';
    NetworkHelper networkHelper = NetworkHelper(url);

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  // call this to get weather data and it's dynamic is changes regularly
  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    // can only wait on futures - have to wait for this method to complete in order to get lat and long
    await location.getCurrentLocation();
    // gets the location co-ordinates before running the get data method
    NetworkHelper networkHelper = NetworkHelper('$openWeatherMapUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey');
    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
