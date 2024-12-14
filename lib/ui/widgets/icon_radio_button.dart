import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/theme_utils.dart';

class IconRadioButton extends StatelessWidget {
  final String iconPath;
  final String text;
  final int value;
  final int groupValue;
  final ValueChanged<int> onChanged;

  const IconRadioButton(
      {super.key,
      required this.iconPath,
      required this.text,
      required this.value,
      required this.groupValue,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(value),
      child: Container(
        height: 80,
        width: 80,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration: BoxDecoration(
            // color: groupValue == value ? Colors.blue : Colors.white,
            gradient: groupValue == value
                ? LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: ThemeUtils.gradientButton,
                  )
                : null,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
                color: groupValue == value ? Colors.transparent : Colors.black,
                width: 1)),
        child: Column(
          children: [
            SvgPicture.asset(
              iconPath,
              color: groupValue == value ? Colors.white : Colors.black,
              width: 20,
              height: 20,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              text,
              style: TextStyle(
                color: groupValue == value ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IconRadioButton2 extends StatelessWidget {
  final String iconPath;
  final String text;
  final int value;
  final int groupValue;
  final ValueChanged<int> onChanged;
  final Color borderColor;

  const IconRadioButton2(
      {super.key,
      required this.iconPath,
      required this.text,
      required this.value,
      required this.groupValue,
      required this.onChanged,
      this.borderColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(value),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        decoration: BoxDecoration(
          gradient: groupValue == value
              ? LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: ThemeUtils.gradientButton,
                )
              : null,
          color: groupValue == value ? null : Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Color(0x40000000),
              offset: Offset(0, 4),
              blurRadius: 5,
              spreadRadius: 0,
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              iconPath,
              color: groupValue == value ? Colors.white : Colors.black,
              height: 40,
            ),
            const SizedBox(height: 5),
            Text(
              text,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: groupValue == value ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
