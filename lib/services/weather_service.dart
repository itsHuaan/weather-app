import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  static var BASE_URL = dotenv.env['BASE_URL'];
  final String? apiKey;

  WeatherService({required this.apiKey});

  Future<Weather> getWeather(String cityName) async {
    final response = await http.get(Uri.parse('$BASE_URL?q=$cityName&appid=$apiKey&units=metric'));
    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<String> getCurrentCity() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return "Permission denied";
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return "Permission denied forever. Please enable location services from settings.";
    }
    try {
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      );
      List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
      String? city = placemarks[0].locality;
      if (city == null || city.isEmpty) {
        city = placemarks[0].administrativeArea;
      }
      // String? city = placemarks[0].administrativeArea;
      for (var placemark in placemarks) {
        print('${placemark.toString()}\n\n');
      }
      return city ?? "Unknown city";
    } catch (e) {
      return "Failed to get location: ${e.toString()}";
    }
  }
}
