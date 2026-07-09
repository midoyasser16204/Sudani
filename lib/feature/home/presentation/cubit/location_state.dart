import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class LocationState {}

class LocationInitial extends LocationState {}

class LocationLoading extends LocationState {}

class LocationLoaded extends LocationState {
  final LatLng position;
  final Set<Marker> markers;
  final bool isOutOfBoundary;

  LocationLoaded({
    required this.position,
    required this.markers,
    this.isOutOfBoundary = false,
  });
}

class LocationError extends LocationState {
  final String message;

  LocationError(this.message);
}
