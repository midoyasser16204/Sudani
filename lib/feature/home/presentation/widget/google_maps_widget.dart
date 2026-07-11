import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/generated/l10n.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/utils/map_marker_helper.dart';
import '../cubit/location_cubit.dart';
import '../cubit/location_state.dart';

class GoogleMapsWidget extends StatefulWidget {
  const GoogleMapsWidget({super.key});

  @override
  State<GoogleMapsWidget> createState() => _GoogleMapsWidgetState();
}

class _GoogleMapsWidgetState extends State<GoogleMapsWidget> {
  GoogleMapController? _mapController;

  @override
  void initState() {
    super.initState();
    _loadCustomMarker();
    context.read<LocationCubit>().getCurrentLocation();
  }

  @override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }

  Future<void> _loadCustomMarker() async {
    final icon = await MapMarkerHelper.createMarkerFromSvg(Assets.locationPin);
    if (mounted) {
      context.read<LocationCubit>().updateMarkerIcon(icon);
    }
  }

  void _animateToPosition(LatLng position) {
    _mapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: position, zoom: 15.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: BlocConsumer<LocationCubit, LocationState>(
          listener: (context, state) {
            if (state is LocationLoaded) {
              _animateToPosition(state.position);
            }
          },
          builder: (context, state) {
            if (state is LocationLoading) {
              return Container(
                color: AppColor.primaryColor,
                child: const Center(child: CircularProgressIndicator()),
              );
            }

            if (state is LocationError) {
              return Container(
                color: AppColor.primaryColor,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(Assets.locationPin),
                      SizedBox(height: 16.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32.w),
                        child: Text(
                          state.message,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColor.primaryTextColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      ElevatedButton(
                        onPressed: () {
                          context.read<LocationCubit>().retry();
                        },
                        child: Text(S.of(context).retry),
                      ),
                    ],
                  ),
                ),
              );
            }

            if (state is LocationLoaded) {
              return GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: state.position,
                  zoom: 15.0,
                ),
                onMapCreated: (GoogleMapController controller) {
                  _mapController = controller;
                },
                markers: state.markers,
                myLocationButtonEnabled: false,
                zoomControlsEnabled: false,
                compassEnabled: false,
                mapToolbarEnabled: false,
                rotateGesturesEnabled: false,
                scrollGesturesEnabled: false,
                tiltGesturesEnabled: false,
                zoomGesturesEnabled: false,
                mapType: MapType.normal,
              );
            }
            return Container(
              color: AppColor.primaryColor,
              child: const Center(child: CircularProgressIndicator()),
            );
          },
        ),
      ),
    );
  }
}
