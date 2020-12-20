import 'package:geolocator/geolocator.dart';

class Location{
  double longitude;
  double latitude;

  Future<void> getCurrentLocation()async{
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      //print(position);
      latitude = position.latitude;
      longitude = position.longitude;
    }
    catch(e){
      print(e);
    }
  }

}