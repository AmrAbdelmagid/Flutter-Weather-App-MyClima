import 'package:flutter/material.dart';
import '../services/location.dart';
import '../services/networking.dart';

const String kMyOpenWeatherApiKey = '964b68dc902da67f36d325abde0d4cf5';
const String kOpenWeatherMapUrl = 'https://api.openweathermap.org/data/2.5/weather';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        url: '$kOpenWeatherMapUrl?lat=${location.getLatitude()}&lon=${location
            .getLongitude()}&appid=$kMyOpenWeatherApiKey');
    var weatherData = await networkHelper.getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
