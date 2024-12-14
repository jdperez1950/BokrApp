import 'dart:async';
import 'dart:math';

import 'package:brokr/ui/widgets/item_card.dart';
import 'package:custom_map_markers/custom_map_markers.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapExploreFragment extends StatefulWidget {
  const MapExploreFragment({super.key});

  @override
  State createState() => _MapExploreFragment();
}

class _MapExploreFragment extends State<MapExploreFragment> {
  final Completer<GoogleMapController> _controller = Completer();
  final List<MarkerData> _markers = [];
  late CameraPosition _initialPosition;
  final List<LatLng> _points = [];

  //Function to get 100 points random in miami florida
  List<LatLng> _getRandomPoints(LatLng center, int radius, int totalPoints) {
    final List<LatLng> points = [];
    final Random random = Random();
    final double radiusInDegrees = radius / 111000;
    for (int i = 0; i < totalPoints; i++) {
      final double u = random.nextDouble();
      final double v = random.nextDouble();
      final double w = radiusInDegrees * sqrt(u);
      final double t = 2 * pi * v;
      final double x = w * cos(t);
      final double y = w * sin(t);
      final double newX = x / cos(center.latitude);
      final double foundLongitude = newX + center.longitude;
      final double foundLatitude = y + center.latitude;
      points.add(LatLng(foundLatitude, foundLongitude));
    }
    return points;
  }

  _customMarker3(String text) {
    return Container(
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.all(4),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      child: Center(
          child: Text(
        text,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      )),
    );
  }

  @override
  void initState() {
    _initialPosition = const CameraPosition(
      target: LatLng(27.670283, -81.357442),
      zoom: 10,
    );
    _points.addAll(_getRandomPoints(_initialPosition.target, 100000, 100));
    for (int i = 0; i < _points.length; i++) {
      // final MarkerId markerId = MarkerId(i.toString());
      // final Marker marker = Marker(
      //   markerId: markerId,
      //   position: _points[i],
      //   infoWindow: InfoWindow(
      //     title: 'Marker $i',
      //     snippet: 'This is marker $i',
      //   ),
      //   onTap: () {
      //     // setState(() {
      //     //   _showExperience = true;
      //     //   _selectedExperience = _points[i];
      //     // });
      //   },
      // );
      _markers.add(MarkerData(
          marker:
              Marker(markerId: MarkerId(i.toString()), position: _points[i]),
          child: _customMarker3('\$${i + 100}')));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomGoogleMapMarkerBuilder(
            //screenshotDelay: const Duration(seconds: 4),
            customMarkers: _markers,
            builder: (BuildContext context, Set<Marker>? markers) {
              if (markers == null) {
                return const Center(child: CircularProgressIndicator());
              }
              return GoogleMap(
                myLocationEnabled: true,
                mapType: MapType.normal,
                initialCameraPosition: _initialPosition,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                onTap: (latLng) {
                  // setState(() {
                  //   _showExperience = false;
                  //   FormUtils.awaitPage(const Duration(milliseconds: 300))
                  //       .then((value) {
                  //     _selectedExperience = null;
                  //   });
                  // });
                },
                markers: markers,
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 220,
              margin: const EdgeInsets.only(bottom: 16),
              child: ListView.builder(
                padding: const EdgeInsets.only(left: 16),
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (_, i) {
                  String image;
                  switch (i) {
                    case 3:
                      image =
                          'https://media.gettyimages.com/id/153642886/es/foto/alegre-joven-montando-en-un-bote.jpg?s=612x612&w=gi&k=20&c=y4eBMQQokoc1euCgwfqWsXM5QhODmdAWVoKopWuQYTE=';
                      break;
                    case 2:
                      image =
                          'https://static4.depositphotos.com/1000129/313/i/950/depositphotos_3139714-stock-photo-motor-yatch.jpg';
                      break;
                    case 1:
                      image =
                          'https://cf.bstatic.com/xdata/images/hotel/max1024x768/271619464.jpg?k=9b269183149ff60cf826037d01b57c1091d2be5ac2e0f091a76ab48eaee0f987&o=&hp=1';
                      break;
                    case 0:
                    default:
                      image =
                          'https://imageio.forbes.com/specials-images/imageserve/6064c6802c761b99a89d1f21/0x0.jpg?format=jpg&crop=2375,1336,x0,y120,safe&width=1200';
                      break;
                  }
                  return SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: ItemCard(
                      title: 'Luxury Villa 5bed/6bath waterfront',
                      address: 'Miami Beach Florida, United States',
                      heightImage: 105,
                      rating: 4.5,
                      image: image,
                      price: 7490,
                      price2: 7899,
                      isFavourite: i == 0,
                      margin: const EdgeInsets.only(right: 16),
                      isSmall: true,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
