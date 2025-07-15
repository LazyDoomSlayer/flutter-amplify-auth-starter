import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_amplify_auth_starter/theme/dark_colors.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final _mapViewController = ArcGISMapView.createController();

  void onMapViewReady() {
    final map = ArcGISMap.withBasemapStyle(BasemapStyle.arcGISTopographic);

    _mapViewController.arcGISMap = map;
    _mapViewController.setViewpoint(
      Viewpoint.withLatLongScale(
        latitude: 34.02700,
        longitude: -118.80500,
        scale: 72000,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DarkColors.backgroundBody,
      appBar: AppBar(backgroundColor: DarkColors.backgroundBody, elevation: 0),
      body: Column(
        children: [
          Expanded(
            child: ArcGISMapView(
              controllerProvider: () => _mapViewController,
              onMapViewReady: onMapViewReady,
            ),
          ),
        ],
      ),
    );
  }
}
