import 'package:flutter/material.dart';
import '../services/networking.dart';
import '../services/weather.dart';
import '../services/weather.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
{
  @override
  void initState()
  {
    super.initState();
    getLocationData();
  }

  /* async and await lets you get time consuming tasks like the location - async makes it happen in the background
   asyncload - to load images or large data in the background - similar to async=lazyload
   asynchronous - to carry on tasks in background so other processes can be executed, where as synchronous is more time consuming */
  void getLocationData() async
  {
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationWeather: weatherData);
    }));
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      )
    );
  }
}