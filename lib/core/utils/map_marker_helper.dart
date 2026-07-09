import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart' as vg;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapMarkerHelper {
  MapMarkerHelper._();

  /// Converts an SVG asset to a BitmapDescriptor for use as a Google Maps marker
  /// 
  /// [assetPath] - Path to the SVG asset (e.g., 'assets/images/location_pin.svg')
  /// [size] - Size of the marker in pixels (default: 48.0)
  /// 
  /// Returns a BitmapDescriptor that can be used as a marker icon
  static Future<BitmapDescriptor> createMarkerFromSvg(
    String assetPath, {
    double size = 30.0,
  }) async {
    // Create a picture recorder
    final pictureRecorder = ui.PictureRecorder();
    final canvas = ui.Canvas(pictureRecorder);

    // Load and parse the SVG
    final ByteData data = await rootBundle.load(assetPath);
    final String svgString = String.fromCharCodes(data.buffer.asUint8List());
    final pictureInfo = await vg.vg.loadPicture(
      vg.SvgStringLoader(svgString),
      null,
    );

    // Calculate scale to fit the desired size
    final double scale = size / pictureInfo.size.width;
    canvas.scale(scale);
    canvas.drawPicture(pictureInfo.picture);

    // Convert to image
    final picture = pictureRecorder.endRecording();
    final image = await picture.toImage(size.toInt(), size.toInt());

    // Convert to bytes
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    final imageData = byteData!.buffer.asUint8List();

    // Dispose resources
    pictureInfo.picture.dispose();

    return BitmapDescriptor.bytes(imageData);
  }

  /// Creates a marker with a custom icon from an SVG asset
  /// 
  /// [markerId] - Unique identifier for the marker
  /// [position] - Location where the marker will be placed
  /// [assetPath] - Path to the SVG asset
  /// [size] - Size of the marker in pixels (default: 48.0)
  /// [infoWindowTitle] - Optional title for the info window
  /// 
  /// Returns a Marker with the custom icon
  static Future<Marker> createCustomMarker({
    required String markerId,
    required LatLng position,
    required String assetPath,
    double size = 48.0,
    String? infoWindowTitle,
  }) async {
    final icon = await createMarkerFromSvg(assetPath, size: size);

    return Marker(
      markerId: MarkerId(markerId),
      position: position,
      icon: icon,
      infoWindow: infoWindowTitle != null
          ? InfoWindow(title: infoWindowTitle)
          : const InfoWindow(),
    );
  }
}
