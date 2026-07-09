import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sudani_app/core/error/failure.dart';

abstract class GetCurrentLocationUseCase {
  Future<Either<Failure, Position>> execute();
}
