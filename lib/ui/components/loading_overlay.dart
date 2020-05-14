import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:weather_pro/ui/utilities/switchers.dart';

// Loading screen just for looks and overall user experience
class LoadingOverlay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var loadingProvider = Provider.of<Switchers>(context);
    loadingProvider.loadingTimer();
    return Visibility(
      visible: loadingProvider.isLoading,
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 5,
          sigmaY: 5,
        ),
        child: Container(
          color: Colors.black.withOpacity(0.3),
          width: double.maxFinite,
          height: double.maxFinite,
          child: SpinKitWave(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
