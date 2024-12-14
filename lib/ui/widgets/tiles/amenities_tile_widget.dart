import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AmenitiesTieWidget extends StatelessWidget {
  final String amenitie;
  final String iconPath;

  const AmenitiesTieWidget({
    Key? key,
    required this.amenitie,
    required this.iconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(5),
        height: 20,
        width: 20,
        child: Card(
          borderOnForeground: true,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.black, width: 0.5),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Stack(children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Stack(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(left: 0, top: 20),
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            iconPath,
                            color: Colors.black,
                            width: 20,
                            height: 20,
                          ),
                          Text(amenitie)
                        ],
                      ))
                ],
              ),
            )
          ]),
        ));
  }
}
