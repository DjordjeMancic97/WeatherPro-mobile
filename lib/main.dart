import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:weather_pro/ui/screens/current_weather_screen.dart';
import 'package:weather_pro/ui/utilities/switchers.dart';
import 'networking/weather_repository.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<WeatherRepository>(
            create: (_) => WeatherRepository(),
          ),
          ChangeNotifierProvider<Switchers>(
            create: (_) => Switchers(),
          ),
        ],
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: CurrentWeatherScreen(),
      ),
    );
  }
}
