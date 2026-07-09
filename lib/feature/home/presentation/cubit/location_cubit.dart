import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../core/constants/strings.dart';
import '../../domain/use_case/get_current_location_use_case/get_current_location_use_case.dart';
import '../../domain/use_case/get_location_stream_use_case/get_location_stream_use_case.dart';
import 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  final GetCurrentLocationUseCase _getCurrentLocationUseCase;
  final GetLocationStreamUseCase _getLocationStreamUseCase;
  BitmapDescriptor? _customMarkerIcon;
  StreamSubscription<Position>? _positionStreamSubscription;
  static const LatLng boundaryCenter = LatLng(29.890876, 31.295660);
  static const double boundaryRadiusMeters = 200.0;

  LocationCubit(this._getCurrentLocationUseCase, this._getLocationStreamUseCase) : super(LocationInitial());

  void updateMarkerIcon(BitmapDescriptor icon) {
    _customMarkerIcon = icon;
    if (state is LocationLoaded) {
      final loadedState = state as LocationLoaded;
      final updatedMarkers = {
        Marker(
          markerId: const MarkerId(Strings.currentLocation),
          position: loadedState.position,
          icon: _customMarkerIcon ?? BitmapDescriptor.defaultMarker,
        ),
      };
      emit(LocationLoaded(
        position: loadedState.position,
        markers: updatedMarkers,
        isOutOfBoundary: loadedState.isOutOfBoundary,
      ));
    }
  }

  Future<void> getCurrentLocation() async {
    emit(LocationLoading());

    final result = await _getCurrentLocationUseCase.execute();

    result.fold(
      (failure) => emit(LocationError(failure.message)),
      (position) {
        _emitPosition(position);

        _positionStreamSubscription?.cancel();
        _positionStreamSubscription = _getLocationStreamUseCase
            .execute()
            .listen(
              _emitPosition,
              onError: (_) {}
            );
      },
    );
  }

  void _emitPosition(Position position) {
    final currentPosition = LatLng(position.latitude, position.longitude);

    final double distanceInMeters = Geolocator.distanceBetween(
      currentPosition.latitude,
      currentPosition.longitude,
      boundaryCenter.latitude,
      boundaryCenter.longitude,
    );
    final bool outOfBoundary = distanceInMeters > boundaryRadiusMeters;

    final markers = {
      Marker(
        markerId: const MarkerId(Strings.currentLocation),
        position: currentPosition,
        icon: _customMarkerIcon ?? BitmapDescriptor.defaultMarker,
      ),
    };

    emit(LocationLoaded(
      position: currentPosition,
      markers: markers,
      isOutOfBoundary: outOfBoundary,
    ));
  }

  void retry() {
    getCurrentLocation();
  }

  @override
  Future<void> close() async {
    await _positionStreamSubscription?.cancel();
    return super.close();
  }
}