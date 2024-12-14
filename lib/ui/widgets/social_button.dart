import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialButton extends StatelessWidget {
  final String text;
  final String icon;
  final Function() onTap;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;
  final int? maxTextLines;
  final double? textSize;
  final double cornersRadius;
  final bool applyWidth;
  final bool emptyBackground;

  const SocialButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.onTap,
    this.margin = const EdgeInsets.all(0),
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    this.width,
    this.height = 55,
    this.maxTextLines,
    this.textSize,
    this.cornersRadius = 8,
    this.applyWidth = true,
    this.emptyBackground = false,
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
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(cornersRadius),
          ),
          border: Border.all(
            width: 1,
            color: Colors.black.withOpacity(0.4),
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              height: 24,
              width: 24,
            ),
            Expanded(
              child: Text(
                text,
                maxLines: maxTextLines,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: textSize ?? 17,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SvgPicture.asset(
              icon,
              color: Colors.transparent,
              width: 24,
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
