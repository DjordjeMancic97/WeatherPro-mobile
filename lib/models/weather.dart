import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Weather {
  final temp;
  final humidity;
  final windSpeed;
  final feelsLike;
  final cityName;
  final description;
  final id;
  IconData weatherIcon;
  String message;

  Weather(
      {this.temp,
      this.humidity,
      this.windSpeed,
      this.feelsLike,
      this.cityName,
      this.description,
      this.id});

  factory Weather.fromJson(Map<String, dynamic> parsedJson) {
    return Weather(
        temp: parsedJson['main']['temp'],
        humidity: parsedJson['main']['humidity'],
        windSpeed: parsedJson['wind']['speed'],
        feelsLike: parsedJson['main']['feels_like'],
        cityName: parsedJson['name'],
        description: parsedJson['weather'][0]['description'],
        id: parsedJson['weather'][0]['id']);
  }

  IconData getIcon(int id) {
    if (id >= 200 && id <= 232) {
      this.weatherIcon = WeatherIcons.wi_thunderstorm;
      this.message =
          'Be careful! If you get struck by lightning, you probably won\'t get superpowers! ⚡';
    } else if (id >= 300 && id <= 321) {
      this.weatherIcon = WeatherIcons.wi_sprinkle;
      this.message =
          'It\'s just a little bit of rain, you ain\'t made of sugar. 🍬';
    } else if (id >= 500 && id <= 531) {
      this.weatherIcon = WeatherIcons.wi_rain;
      this.message =
          'It\s raining outside! Bring the umbrella... and a boat! ⛵';
    } else if (id >= 600 && id <= 622) {
      this.weatherIcon = WeatherIcons.wi_snow;
      this.message =
          'Do you wanna build a snowman? Wear something warm, it\'s freezing outside. ☃️';
    } else if (id == 701 || id == 741) {
      this.weatherIcon = WeatherIcons.wi_smog;
      this.message = 'It\s foggy outside, watch your step. 🌁';
    } else if (id == 721) {
      this.weatherIcon = WeatherIcons.wi_day_haze;
      this.message = 'The air tastes funny. Wouldn\'t breath if I were you. 😷';
    } else if (id == 781) {
      this.weatherIcon = WeatherIcons.wi_tornado;
      this.message = 'Pack your bags and go somewhere safe! 🌪️';
    } else if (id == 800) {
      this.weatherIcon = WeatherIcons.wi_wu_clear;
      this.message = 'All clear! Some clouds and sky is probably bluish. 🏙️';
    } else if (id >= 801 && id <= 804) {
      this.weatherIcon = WeatherIcons.wi_cloudy;
      this.message =
          'Look at all those damned clouds! That one looks like a unicorn. 🤔🦄';
    } else {
      this.weatherIcon = WeatherIcons.wi_alien;
      this.message = 'Unknown weather condition, possible alien invasion! 👾🛸';
    }
    return weatherIcon;
  }
}
