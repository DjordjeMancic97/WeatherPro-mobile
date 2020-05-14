import 'package:flutter/material.dart';

const kBackgroundColor = Color(0xff4347bc);
const kAccentColor = Color(0xff9899D1);

// Visibility(
          //   visible: loadingProvider.isLoading,
          //   child: BackdropFilter(
          //     filter: ImageFilter.blur(
          //       sigmaX: 5,
          //       sigmaY: 5,
          //     ),
          //     child: Container(
          //       color: Colors.black.withOpacity(0.3),
          //       width: double.maxFinite,
          //       height: double.maxFinite,
          //       child: SpinKitWave(
          //         color: Colors.white,
          //       ),
          //     ),
          //   ),
          // ),

  //          void searchCity(
  //     {WeatherRepository repo,
  //     String searchText,
  //     LoadingValue loadingProvider}) {
  //   repo.getWeatherByLocation(searchText);

  //   print('Submitted by keyboard search: $searchText');

  //   Future.delayed(Duration(milliseconds: 50)).then(
  //     (_) {
  //       _controller.clear();
  //       FocusScope.of(context).unfocus();
  //       loadingProvider.hideSearch();
  //     },
  //   );
  // }
// decoration: BoxDecoration(
//           image: DecorationImage(
//             colorFilter: ColorFilter.mode(
//                 Colors.black.withOpacity(0.15), BlendMode.darken),
//             image: AssetImage('assets/images/bg3.jpg'),
//             fit: BoxFit.cover,
//           ),
//         ),