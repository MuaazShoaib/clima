import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    try {
      // somethingThatExpectsLessThan10(12);
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      print(position);
    } catch (exception) {
      print(exception);
    }
  }

  void somethingThatExpectsLessThan10(int n) {
    if (n > 10) {
      throw 'n is greater than 10, n should always be less than 10.';
    }
  }

  @override
  Widget build(BuildContext context) {
    // String myMargin = '15';
    String myMargin = 'abc';

    double myMarginAsADouble = 0.0;
    try {
      myMarginAsADouble = double.parse(myMargin);
    } catch (exception) {
      print(exception);
      myMarginAsADouble = 30.0;
    }
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(myMarginAsADouble),
        color: Colors.red,
      ),
    );
  }
}
