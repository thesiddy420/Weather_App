import 'package:geolocator/geolocator.dart';

class Location{

  late final double latitude;
  late final double longitude;

  Future<void> getCurrentLocation() async{

    try{
    LocationPermission permission = await Geolocator.checkPermission();

    if(permission == LocationPermission.denied || permission == LocationPermission.deniedForever){
      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.denied || permission == LocationPermission.deniedForever){
        latitude = double.infinity;
        longitude = double.infinity;
        return;
      }
    }
   
    
      Position position = await
      Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      
      latitude = position.latitude;
      longitude = position.longitude;

    }
    catch(e){
      print("permission denied!");
    }
  }
}