import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:weather_pro/networking/weather_repository.dart';
import 'package:weather_pro/ui/components/detailed_card.dart';
import 'package:weather_pro/ui/components/loading_overlay.dart';
import 'package:weather_pro/ui/components/searchfield.dart';
import 'package:weather_pro/ui/components/temp_stats.dart';

class CurrentWeatherScreen extends StatefulWidget {
  @override
  _CurrentWeatherScreenState createState() => _CurrentWeatherScreenState();
}

class _CurrentWeatherScreenState extends State<CurrentWeatherScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var model = Provider.of<WeatherRepository>(context);

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.15), BlendMode.darken),
          image: AssetImage('assets/images/bg3.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(   // Stack is used here in order to allow the LoadingOverlay to go over all other Widgets
        children: <Widget>[
          SafeArea(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Expanded(
                              child: SearchField(
                                controller: _controller,
                              ),
                            ),
                            Expanded(
                              flex: 0,
                              child: ButtonTheme(
                                minWidth: 50.0,
                                child: FlatButton(
                                  padding: EdgeInsets.symmetric(vertical: 10.0),
                                  child: Icon(
                                    FontAwesome.bars,
                                    color: Colors.white,
                                  ),
                                  onPressed: () => print('menu pressed'),
                                ),
                              ),
                            ),
                          ],
                        ),
                        TempStats(
                          temp: model?.weather?.temp?.toStringAsFixed(0) ?? 'x',
                          weatherIcon:
                              model?.weather?.getIcon(model?.weather?.id) ??
                                  WeatherIcons.wi_alien,
                          description: model?.weather?.description ?? 'no data',
                          cityName:
                              'in ${model?.weather?.cityName ?? 'Neverland'}',
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      model?.weather?.message ?? 'No information',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
                Divider(
                  color: Colors.white,
                ),
                Expanded(
                  flex: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      DetailedCard(
                        header: 'HUMIDITY',
                        text: '${model?.weather?.humidity?.toString() ?? 0}%',
                      ),
                      DetailedCard(
                        header: 'WIND KM/H',
                        text: model?.weather?.windSpeed?.toString() ?? '0',
                      ),
                      DetailedCard(
                        header: 'FEELS LIKE',
                        text:
                            '${model?.weather?.feelsLike?.toStringAsFixed(0) ?? 0}°',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          LoadingOverlay(),
        ],
      ),
    );
  }
}
