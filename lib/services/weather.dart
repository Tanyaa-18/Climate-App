import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey =  '0032d7608d17ef563774e05c4649b970';
const OpenWeatherAppURL ='https://api.openweathermap.org/data/2.5/weather';
class WeatherModel {

  Future<dynamic> getCityWeather(String CityName) async{
    var url = '$OpenWeatherAppURL?q=$CityName&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);
    var WeatherData = await networkHelper.getData();
    return WeatherData;

  }


  Future<dynamic> getLocationWeather()async{
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper('$OpenWeatherAppURL?lat=${location.latitude}&lon=${location.latitude}&appid=$apiKey&units=metric');

    var  WeatherData = await networkHelper.getData();
    return WeatherData;
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
