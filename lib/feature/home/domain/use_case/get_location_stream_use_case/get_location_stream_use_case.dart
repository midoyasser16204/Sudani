import 'package:geolocator/geolocator.dart';

abstract class GetLocationStreamUseCase {
  Stream<Position> execute();
}
