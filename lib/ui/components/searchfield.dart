import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:weather_pro/networking/weather_repository.dart';
import 'package:weather_pro/ui/utilities/switchers.dart';

class SearchField extends StatelessWidget {
  final Function onTap;

  final TextEditingController controller;
  final String hintText;

  final Widget suffixIcon;

  const SearchField({
    Key key,
    this.onTap,
    this.controller,
    this.hintText,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchProvider = Provider.of<Switchers>(context);
    var weatherProvider = Provider.of<WeatherRepository>(context);
    var dateTime = DateTime.now();
    var formatter = DateFormat('EEEE, dd MMM');
    var formatDate = formatter.format(dateTime);

    return Stack(
      alignment: AlignmentDirectional.centerEnd,
      children: <Widget>[
        Positioned(
          left: 0,
          child: Visibility(
            visible: !searchProvider.isSearchVisible,
            child: Text(
              '$formatDate',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
          ),
        ),
        Visibility(
          visible: searchProvider.isSearchVisible,
          child: TextField(
            autofocus: true,
            onTap: onTap,
            onSubmitted: (value) {
              if (value.trim() != '') {
                weatherProvider.getWeatherByLocation(value);
              }
              searchProvider.showSearch();
              controller.clear();
            },
            textInputAction: TextInputAction.search,
            controller: controller,
            style: TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.italic,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(
                  style: BorderStyle.solid,
                  color: Colors.white,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(
                  style: BorderStyle.solid,
                  color: Colors.white,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(
                  style: BorderStyle.solid,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          child: ButtonTheme(
            minWidth: 50.0,
            child: FlatButton(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              onPressed: () {
                searchProvider.showSearch();
                if (controller.text.trim() != '') {
                  weatherProvider.getWeatherByLocation(controller.text);
                }
                controller.clear();
              },
              child: Icon(
                FontAwesome.search,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
