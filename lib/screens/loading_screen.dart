import 'package:flutter/material.dart';
import 'package:my_clima_app/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_clima_app/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Exception exception;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    try {
      var weatherData = await WeatherModel().getWeatherData();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => LocationScreen(
                    locationWeatherData: weatherData,
                  )));
    } catch (e) {
      exception = e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return (exception == null) ? Scaffold (
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    ) : Scaffold(body: Center(
      child: FlatButton(onPressed: getLocationData ,child: Text('Internet Error: Try Again'),),
    ),) ;
  }
}
