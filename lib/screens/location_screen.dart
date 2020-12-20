import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';
import 'city_screen.dart';


class LocationScreen extends StatefulWidget {
  LocationScreen({this.WeatherLocation});
  final WeatherLocation;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  int temperature;
  String name;
  String WeatherIcon;
  String WeatherMessage;

@override
  void initState(){
    super.initState();
   // print(widget.WeatherLocation);
  updateUI(widget.WeatherLocation);
  }

  void updateUI(dynamic WeatherData){
  setState(() {
    if(WeatherData==null){
      temperature=0;
      WeatherIcon='Error';
      WeatherMessage='Unable to locate you ';
      name='';
      return;

    }
    double temp = WeatherData['main']['temp'];
    temperature=temp.toInt();
    var condition  = WeatherData['weather'][0]['id'];
    WeatherIcon=weather.getWeatherIcon(condition);
    WeatherMessage=weather.getMessage(temperature);
    name = WeatherData['name'];
  });



}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      var WeatherData = await weather.getLocationWeather();
                      updateUI(WeatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      var typedName = await Navigator.push(context, MaterialPageRoute(builder:(context){
                        return CityScreen();
                      },
                      ),
                      );
                      if(typedName != null){
                          var weatherdata = await weather.getCityWeather(typedName);
                          updateUI(weatherdata);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      WeatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  '$WeatherMessage in $name',
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// var weatherData = await networkSelector.getData();
// var temperature = decoded['main']['temp'];
// print(temperature);
// var idd = decoded['weather'][0]['id'];
// print(idd);
// var name = decoded['name'];
// print(name);