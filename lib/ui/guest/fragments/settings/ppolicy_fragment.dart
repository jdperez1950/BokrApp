import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

import '../../../widgets/icon_widget.dart';

class PpolicyFragment extends StatelessWidget {
  final double height = 50;
  static const double borderRadius = 4.0;
  TextEditingController textarea = TextEditingController();

  @override
  Widget build(BuildContext context) => SimpleSettingsTile(
        title: 'Privacy Policy',
        leading: const IconWidget(
            icon: Icons.menu_book_outlined, color: Colors.white),
        child: SettingsScreen(
          title: 'Privacy Policy',
          children: <Widget>[
            const SizedBox(height: 32),
            Text("Lorem Ipsum"),
            const SizedBox(height: 32),
            const SizedBox(height: 32),
          ],
        ),
      );
}
