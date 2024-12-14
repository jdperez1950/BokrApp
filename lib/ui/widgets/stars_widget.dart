import 'package:flutter/material.dart';

class StarsWidget extends StatelessWidget {
  final double rating;
  final double size;

  const StarsWidget({super.key, required this.rating, required this.size});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i = 0; i < rating.toInt(); i++)
          Icon(Icons.star, color: Colors.amber, size: size),
        rating % 1 == 0
            ? Container()
            : Icon(Icons.star_half_outlined, color: Colors.amber, size: size),
        for (var i = 0; i < (5 - rating).toInt(); i++)
          Icon(Icons.star_border_outlined, color: Colors.amber, size: size)
      ],
    );
  }
}
