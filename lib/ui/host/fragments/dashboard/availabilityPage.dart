import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/dashboard_tile_widget.dart';

class AvailabilityPage extends StatelessWidget {
  //final controller = Get.put(AvailabilityPageController());

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          title: const Text(
            'Availability',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: [
            GestureDetector(
                onTap: () {},
                child: const DashboardTile(
                    text: "Availability", icon: Icons.lock_clock_outlined))
          ],
        ),
      );
}
