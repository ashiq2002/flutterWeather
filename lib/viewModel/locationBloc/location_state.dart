abstract class LocationState{}

class LocationLoadingState extends LocationState{}
class LocationGrantedState extends LocationState{
  final double latitude;
  final double longitude;

  LocationGrantedState(this.latitude, this.longitude);
}
class LocationDeniedState extends LocationState{
  final String message;

  LocationDeniedState(this.message);
}
