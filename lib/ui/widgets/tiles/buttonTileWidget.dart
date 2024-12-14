import 'package:flutter/material.dart';

class ButtonTile extends StatelessWidget {
  final double height;
  final double width;
  final Widget? child;

  const ButtonTile({
    Key? key,
    required this.height,
    required this.width,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        child: Card(
          color: Color.fromRGBO(255, 255, 255, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          elevation: 5,
          child: Padding(
            padding: EdgeInsets.all(7),
            child: Stack(children: <Widget>[
              Align(
                alignment: Alignment.topCenter,
                child: Stack(
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.only(left: 0, top: 10),
                        child: child)
                  ],
                ),
              )
            ]),
          ),
        ));
  }
}
