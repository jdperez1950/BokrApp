import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_loading/card_loading.dart';
import 'package:custom_map_markers/custom_map_markers.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationWidget extends StatelessWidget {
  // final CameraPosition position;
  // final MarkerData marker;
  final double sideSize;

  const LocationWidget({
    super.key,
    required this.sideSize,
  });
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl:
          'https://www.google.com/maps/d/u/0/thumbnail?mid=1ViO8cC-zEvU6Ok3YEHmouDwB7LU&hl=en_US',
      imageBuilder: (context, imageProvider) => Stack(
        children: [
          Container(
            width: sideSize,
            height: sideSize,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
            ),
          ),
        ],
      ),
      placeholder: (context, url) => CardLoading(
        width: sideSize,
        height: sideSize,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
