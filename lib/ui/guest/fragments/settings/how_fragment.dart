import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

import '../../../widgets/icon_widget.dart';

class HowFragment extends StatelessWidget {
  final double height = 50;
  static const double borderRadius = 4.0;

  @override
  Widget build(BuildContext context) => SimpleSettingsTile(
        title: 'How Brokr Works',
        leading:
            const IconWidget(icon: Icons.house_outlined, color: Colors.white),
        child: SettingsScreen(
          title: 'How Brokr Works',
          children: <Widget>[
            const SizedBox(height: 32),
            Text("Lorem Ipsum"),
            const SizedBox(height: 32),
            const SizedBox(height: 32),
          ],
        ),
      );
}
