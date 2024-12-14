import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/theme_utils.dart';

class CharactersticsWidget extends StatelessWidget {
  final String iconPath;
  final String name;
  final String value;

  const CharactersticsWidget({
    super.key,
    required this.iconPath,
    required this.name,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(
            iconPath,
            color: Colors.black,
            width: 20,
            height: 20,
          ),
          Text(name),
          Text(
            value,
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
