import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import '../../../../widgets/icon_widget.dart';

class HouseRulesFragment extends StatelessWidget {
  final double height = 50;
  static const double borderRadius = 4.0;

  @override
  Widget build(BuildContext context) => SimpleSettingsTile(
        title: 'House Rules',
        leading:
            const IconWidget(icon: Icons.help_outline, color: Colors.white),
        child: SettingsScreen(
          title: 'House Rules',
          children: <Widget>[
            const SizedBox(height: 32),
            Text("Lorem Ipsum"),
            const SizedBox(height: 32),
            const SizedBox(height: 32),
          ],
        ),
      );
}
