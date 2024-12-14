import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/dashboard_tile_widget.dart';

class DocumentsPage extends StatelessWidget {
  //final controller = Get.put(DocumentsPageController());

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          title: const Text(
            'Documents',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: [
            GestureDetector(
                onTap: () {},
                child: const DashboardTile(
                    text: "Documents", icon: Icons.lock_clock_outlined))
          ],
        ),
      );
}
