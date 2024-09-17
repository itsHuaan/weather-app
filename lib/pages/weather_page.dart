import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final _weatherService = WeatherService(apiKey: dotenv.env['API_KEY']);
  Weather? _weather;

  _fetchWeather() async {
    String cityName = await _weatherService.getCurrentCity();
    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {}
  }

  String getWeatherConditionAnimation(String? weatherCondition) {
    if (weatherCondition == null) return 'assets/weather_conditions/clear_sky.json';

    switch (weatherCondition.toLowerCase()) {
      case 'few clouds':
        return 'assets/weather_conditions/few_clouds.json';
      case 'scattered clouds':
        return 'assets/weather_conditions/cloud.json';
      case 'broken clouds':
        return 'assets/weather_conditions/cloud.json';
      case 'shower rain':
        return 'assets/weather_conditions/shower_rain.json';
      case 'rain':
        return 'assets/weather_conditions/rain.json';
      case 'thunderstorm':
        return 'assets/weather_conditions/thunderstorm.json';
      case 'snow':
        return 'assets/weather_conditions/snow.json';
      case 'mist':
        return 'mist';
      default:
        return 'assets/weather_conditions/clear_sky.json';
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Icon(
                Icons.location_on_rounded,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            Text(
              _weather?.cityName.toUpperCase() ?? "Loading city...",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: 20.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 230.0),
              child: Lottie.asset(getWeatherConditionAnimation(_weather?.mainCondition ?? "")),
            ),
            Text(
              '${_weather?.temperature.toStringAsFixed(0)}°',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: 50.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
