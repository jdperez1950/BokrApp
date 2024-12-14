import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/dashboard_tile_widget.dart';

class ClientsPage extends StatelessWidget {
  //final controller = Get.put(ClientsPageController());

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          title: const Text(
            'Clients',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: [
            GestureDetector(
                onTap: () {},
                child: const DashboardTile(
                    text: "Clients", icon: Icons.lock_clock_outlined))
          ],
        ),
      );
}
