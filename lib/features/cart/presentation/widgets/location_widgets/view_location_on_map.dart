import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:marketi/core/constansts/map_constants.dart';
import 'package:marketi/core/styles/app_colors.dart';

class ViewLocationOnMap extends StatefulWidget {
  const ViewLocationOnMap({super.key, required this.lat, required this.lng});
  final double lat;
  final double lng;

  @override
  State<ViewLocationOnMap> createState() => _ViewLocationOnMapState();
}

class _ViewLocationOnMapState extends State<ViewLocationOnMap> {
  final MapController _mapController = MapController();

  @override
  void didUpdateWidget(covariant ViewLocationOnMap oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.lat != widget.lat || oldWidget.lng != widget.lng) {
      _mapController.move(LatLng(widget.lat, widget.lng), 17);
    }
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: _mapController,
      options: MapOptions(
        initialCenter: LatLng(widget.lat, widget.lng),
        initialZoom: 17,
      ),
      children: [
        TileLayer(
          urlTemplate: MapConstants.mapUrlTemplate,
          userAgentPackageName: MapConstants.userAgentPackageName,
        ),
        MarkerLayer(
          markers: [
            Marker(
              point: LatLng(widget.lat, widget.lng),
              child: const Icon(
                Icons.location_pin,
                color: AppColors.primary,
                size: 44,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
