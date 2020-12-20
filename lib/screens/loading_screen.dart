//import 'dart:convert';
 //import 'package:http/http.dart' as http;
//import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
//import 'package:clima/services/location.dart';
import 'location_screen.dart';
//import 'package:clima/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';

//import 'dart:developer';



//const apiKey =  '0032d7608d17ef563774e05c4649b970';//'b6907d289e10d714a6e88b30761fae22';'0032d7608d17ef563774e05c4649b970';

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
    // try {
    //   Position position = await Geolocator.getCurrentPosition(
    //       desiredAccuracy: LocationAccuracy.low);
    //   print(position);
    // }
    // catch(e){
    //   print(e);
    // }
    //print(location.longitude);
    //print(location.latitude);

    // NetworkHelper networkHelper = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.latitude}&appid=$apiKey&units=metric');
    //
    // var  WeatherData = await networkHelper.getData();
    WeatherModel weathermodel = WeatherModel();
    var WeatherData= await weathermodel.getLocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(
        WeatherLocation:WeatherData
      );
    }));
   // getData();
  }

  // void getData() async{
  // http.Response response = await http.get('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');
   //print(response.statusCode);

    //if(response.statusCode==200){
    //String data =  response.body;
    //var decoded = jsonDecode(data);
    // var temperature = decoded['main']['temp'];
    // print(temperature);
    // var idd = decoded['weather'][0]['id'];
    // print(idd);
    // var name = decoded['name'];
    // print(name);

    // }
    // else{
    //   print(response.statusCode);
    //
    // }
  //}

  @override
  Widget build(BuildContext context) {
    //getData();
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,

        )
      //     child: RaisedButton(
      //     onPressed: () {
      //       //Get the current location
      //       getLocation();
      //     },
      //     child: Text('Get Location'),
      //      ),
        )
    );
  }
}



