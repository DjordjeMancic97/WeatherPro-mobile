import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:weather_pro/ui/screens/current_weather_screen.dart';
import 'package:weather_pro/ui/utilities/switchers.dart';
import 'networking/weather_repository.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<WeatherRepository>(
          create: (context) => WeatherRepository(),
        ),
        ChangeNotifierProvider<Switchers>(
          create: (context) => Switchers(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'Poppins'),
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          body: CurrentWeatherScreen(),
        ),
      ),
    );
  }
}
