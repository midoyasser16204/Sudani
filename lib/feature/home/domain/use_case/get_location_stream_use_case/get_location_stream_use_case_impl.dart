import 'package:geolocator/geolocator.dart';
import 'package:sudani_app/core/services/location_service.dart';
import 'get_location_stream_use_case.dart';

class GetLocationStreamUseCaseImpl implements GetLocationStreamUseCase {
  final LocationService _locationService;

  GetLocationStreamUseCaseImpl(this._locationService);

  @override
  Stream<Position> execute() {
    return _locationService.getPositionStream();
  }
}
