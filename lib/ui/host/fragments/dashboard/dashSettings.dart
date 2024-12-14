import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/dashboard_tile_widget.dart';

class DashSettingsPage extends StatelessWidget {
  //final controller = Get.put(DashSettingsPageController());

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          title: const Text(
            'Settings',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: [
            GestureDetector(
                onTap: () {},
                child: const DashboardTile(
                    text: "dashSettings", icon: Icons.lock_clock_outlined))
          ],
        ),
      );
}
