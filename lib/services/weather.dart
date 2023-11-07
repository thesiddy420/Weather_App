import '../services/networking.dart';
import '../services/location.dart';

const apikey = 'a0f5daa35ebbbd56573001bf16c13837';

class WeatherModel {

  Future<dynamic> getLocationByCityName(String cityName) async{

    NetworkHelper helper = NetworkHelper(
        url:'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apikey');

    var decoded = await helper.getData();
    print('decoded from byCityNmae is: $decoded');
    return decoded;


  }

  Future<dynamic> getLocationWeatherData() async{
  Location location = Location();
    await location.getCurrentLocation();

    if(location.latitude == double.infinity) return null;

    NetworkHelper helper = NetworkHelper(
        url:
            'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey');

    var decoded = await helper.getData();
    return decoded;
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
      return 'I don\'t know , MayBe Bring a 🧥 just in case';
    }
  }
}
