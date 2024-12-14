import 'dart:math';

import 'package:flutter/material.dart';

import '../../utils/theme_utils.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  // final Color backgroundColor;
  // final Color borderColor;
  // final Color textColor;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;
  final int? maxTextLines;
  final double? textSize;
  final double cornersRadius;
  final bool applyWidth;
  final bool emptyBackground;
  final LinearGradient? gradient;
  final FontWeight weight;

  const GradientButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.margin = const EdgeInsets.all(0),
    this.padding = const EdgeInsets.all(0),
    this.width,
    this.height = 50,
    this.maxTextLines,
    this.textSize,
    this.cornersRadius = 8,
    this.applyWidth = true,
    this.emptyBackground = false,
    this.gradient,
    this.weight = FontWeight.w500,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: applyWidth ? width ?? double.infinity : null,
        height: height,
        alignment: Alignment.center,
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          gradient: gradient ??
              LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: ThemeUtils.gradientButton,
              ),
          borderRadius: BorderRadius.all(
            Radius.circular(cornersRadius),
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0, 1), //(x,y)
              blurRadius: 2,
            ),
          ],
        ),
        child: Text(
          text,
          maxLines: maxTextLines,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.white,
            fontSize: textSize ?? 16,
            fontWeight: weight,
          ),
        ),
      ),
    );
  }
}
