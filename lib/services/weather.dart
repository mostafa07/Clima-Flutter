import '../utilities/constants.dart';
import 'location.dart';
import 'networking.dart';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var weatherData = await NetworkHelper().getData(
        '$kOpenWeatherApiUrl?q=$cityName&appid=$kOpenWeatherApiKey&units=metric');
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    final Location location = Location();
    await location.getCurrentLocation();

    var weatherData = await NetworkHelper().getData(
        '$kOpenWeatherApiUrl?lat=${location.latitude.toStringAsFixed(1)}&lon=${location.longitude.toStringAsFixed(1)}&appid=$kOpenWeatherApiKey&units=metric');
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
