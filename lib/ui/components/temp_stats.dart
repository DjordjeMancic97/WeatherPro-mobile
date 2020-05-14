import 'package:flutter/material.dart';

// TempStats widget is responsible for showing temperature, weather icon, weather description and city name
class TempStats extends StatelessWidget {
  final String temp;
  final IconData weatherIcon;
  final String description;
  final String cityName;

  const TempStats(
      {Key key, this.temp, this.weatherIcon, this.description, this.cityName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Positioned(
            child: Text(
              '$temp°',
              style: TextStyle(
                color: Colors.white,
                fontSize: 90.0,
              ),
            ),
          ),
          Positioned(
            top: 105.0,
            child: Icon(
              weatherIcon,
              color: Colors.white,
            ),
          ),
          Positioned(
            left: 35.0,
            top: 108.0,
            child: Text(
              description,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
          ),
          Positioned(
            top: 130.0,
            left: 35.0,
            child: Text(
              cityName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontStyle: FontStyle.italic,
                letterSpacing: 0.8,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
