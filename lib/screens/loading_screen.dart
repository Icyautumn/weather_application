import 'package:clima/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';


class LoadingScreen extends StatefulWidget {

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;

  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();

    // once get data, push to next screen to show the weather
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(locationWeather: weatherData,);
    }));
  }

  // get location when app is opened
  void initState() {
    super.initState();
    getLocationData();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // loading animation while getting data
        child: SpinKitWave(
          color: Colors.blue,
          size: 100.0,
        ),
      ),
    );
  }
}
