import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import '../error/failure.dart';

class LocationService {
  Future<Either<Failure, bool>> isLocationServiceEnabled() async {
    try {
      final isEnabled = await Geolocator.isLocationServiceEnabled();
      return Right(isEnabled);
    } catch (e) {
      return Left(LocationFailure('Failed to check location service: $e'));
    }
  }

  Future<Either<Failure, LocationPermission>> checkPermission() async {
    try {
      final permission = await Geolocator.checkPermission();
      return Right(permission);
    } catch (e) {
      return Left(LocationFailure('Failed to check location permission: $e'));
    }
  }

  Future<Either<Failure, LocationPermission>> requestPermission() async {
    try {
      final permission = await Geolocator.requestPermission();
      return Right(permission);
    } catch (e) {
      return Left(LocationFailure('Failed to request location permission: $e'));
    }
  }

  Future<Either<Failure, Position>> getCurrentPosition() async {
    try {
      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      );
      return Right(position);
    } catch (e) {
      return Left(LocationFailure('Failed to get current position: $e'));
    }
  }

  Stream<Position> getPositionStream() {
    return Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10,
      ),
    );
  }
}
