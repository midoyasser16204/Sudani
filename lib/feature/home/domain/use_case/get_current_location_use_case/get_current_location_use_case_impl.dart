import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sudani_app/core/error/failure.dart';
import 'package:sudani_app/core/services/location_service.dart';
import 'get_current_location_use_case.dart';

class GetCurrentLocationUseCaseImpl implements GetCurrentLocationUseCase {
  final LocationService _locationService;

  GetCurrentLocationUseCaseImpl(this._locationService);

  @override
  Future<Either<Failure, Position>> execute() async {
    final serviceEnabledResult = await _locationService.isLocationServiceEnabled();
    
    // Check service enabled result
    bool serviceEnabled = false;
    if (serviceEnabledResult.isLeft()) {
      return Left((serviceEnabledResult as Left<Failure, bool>).value);
    } else {
      serviceEnabled = (serviceEnabledResult as Right<Failure, bool>).value;
    }
    
    if (!serviceEnabled) {
      return const Left(LocationFailure('Location services are disabled'));
    }

    // Check permission
    final permissionResult = await _locationService.checkPermission();
    LocationPermission permission = LocationPermission.denied;
    
    if (permissionResult.isLeft()) {
      return Left((permissionResult as Left<Failure, LocationPermission>).value);
    } else {
      permission = (permissionResult as Right<Failure, LocationPermission>).value;
    }

    if (permission == LocationPermission.denied) {
      final requestPermissionResult = await _locationService.requestPermission();
      if (requestPermissionResult.isLeft()) {
        return Left((requestPermissionResult as Left<Failure, LocationPermission>).value);
      } else {
        permission = (requestPermissionResult as Right<Failure, LocationPermission>).value;
      }
      
      if (permission == LocationPermission.denied) {
        return const Left(LocationFailure('Location permissions are denied'));
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return const Left(LocationFailure('Location permissions are permanently denied'));
    }

    return await _locationService.getCurrentPosition();
  }
}
