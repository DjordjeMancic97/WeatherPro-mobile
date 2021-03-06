import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:weather_pro/models/weather.dart';
import 'package:fluttertoast/fluttertoast.dart';

const apikey = 'get your own api key';

class WeatherRepository extends ChangeNotifier {
  WeatherRepository() {
    getWeatherByLocation();
  }

  Weather _weather;
  Weather get weather => _weather;

// Function can be used both for location based weather and manual search weather
  void getWeatherByLocation([String cityName]) async {
    try {
      // Check if user has enabled location
      bool locationStatus = await Geolocator().isLocationServiceEnabled();
      print(
          'Trying to get location status... Status: $locationStatus, city is $cityName');
      
      // get user location if no city is supplied and location is enabled
      if (cityName == null && locationStatus) {
        Position position = await Geolocator()
            .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
        print(
            'Checking conditions... location is $locationStatus and city is $cityName');
        List<Placemark> placemark = await Geolocator()
            .placemarkFromCoordinates(position.latitude, position.longitude);
        
        // city name is determined by location
        cityName = placemark[0].locality;
        print('Setting cityName to: $cityName');
      }

      print('Contacting api...');
      String url =
          'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apikey&units=metric';
      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        print(
            'WeatherRepo: Response is ${response.statusCode}, City is $cityName');
        var decodedData = jsonDecode(response.body);
        _weather = Weather.fromJson(decodedData);
      } else if (response.statusCode == 404) {
        print(
            'WeatherRepo: Response is ${response.statusCode}, City is $cityName');
        Fluttertoast.showToast(
            msg: 'City not found', toastLength: Toast.LENGTH_SHORT);

        throw 'Error 404 is triggered when city is not found or on startup if location is denied';
      }
    } on SocketException catch (e) {
      Fluttertoast.showToast(
          msg: 'No internet connection', toastLength: Toast.LENGTH_SHORT);
      print(e);
    } catch (e) {
      print(e);
    }

    notifyListeners();
  }
}
