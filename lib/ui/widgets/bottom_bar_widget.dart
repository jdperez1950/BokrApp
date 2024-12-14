import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/theme_utils.dart';

class BottomBarWidget extends StatelessWidget {
  final List<String> labels;
  final List<String> iconsPath;
  final Function(int) onTabItemSelected;
  final int index;
  final int countNotifications;
  final padding = const EdgeInsets.only(top: 6);

  const BottomBarWidget({
    super.key,
    required this.labels,
    required this.iconsPath,
    required this.onTabItemSelected,
    required this.index,
    required this.countNotifications,
  });

  @override
  Widget build(BuildContext context) {
    return CustomNavigationBar(
      backgroundColor: Colors.white,
      iconSize: 20,
      items: [
        CustomNavigationBarItem(
          icon: SvgPicture.asset(
            iconsPath[0],
            color: index == 0 ? ThemeUtils.primaryColor : Colors.black,
          ),
          title: Padding(
            padding: padding,
            child: Text(
              labels[0],
              style: TextStyle(
                color: index == 0 ? ThemeUtils.primaryColor : Colors.black,
              ),
            ),
          ),
        ),
        CustomNavigationBarItem(
          icon: SvgPicture.asset(
            iconsPath[1],
            color: index == 1 ? ThemeUtils.primaryColor : Colors.black,
          ),
          title: Padding(
            padding: padding,
            child: Text(
              labels[1],
              style: TextStyle(
                color: index == 1 ? ThemeUtils.primaryColor : Colors.black,
              ),
            ),
          ),
        ),
        CustomNavigationBarItem(
          icon: SvgPicture.asset(
            iconsPath[2],
            color: index == 2 ? ThemeUtils.primaryColor : Colors.black,
          ),
          title: Padding(
            padding: padding,
            child: Text(
              labels[2],
              style: TextStyle(
                color: index == 2 ? ThemeUtils.primaryColor : Colors.black,
              ),
            ),
          ),
        ),
        CustomNavigationBarItem(
          icon: SvgPicture.asset(
            iconsPath[3],
            color: index == 3 ? ThemeUtils.primaryColor : Colors.black,
          ),
          title: Padding(
            padding: padding,
            child: Text(
              labels[3],
              style: TextStyle(
                color: index == 3 ? ThemeUtils.primaryColor : Colors.black,
              ),
            ),
          ),
          badgeCount: countNotifications,
          showBadge: countNotifications > 0,
        ),
        CustomNavigationBarItem(
          icon: SvgPicture.asset(
            iconsPath[4],
            color: index == 4 ? ThemeUtils.primaryColor : Colors.black,
          ),
          title: Padding(
            padding: padding,
            child: Text(
              labels[4],
              style: TextStyle(
                color: index == 4 ? ThemeUtils.primaryColor : Colors.black,
              ),
            ),
          ),
        ),
      ],
      currentIndex: index,
      onTap: onTabItemSelected,
    );
  }
}
