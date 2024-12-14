import 'package:brokr/ui/host/fragments/dashboard/team/broker_list_page.dart';
import 'package:brokr/ui/host/fragments/dashboard/team/manager_list_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/dashboard_tile_widget.dart';

class TeamPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          title: const Text(
            'Teams',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: GridView.count(
          mainAxisSpacing: 50,
          crossAxisSpacing: 30,
          padding: EdgeInsets.all(20),
          crossAxisCount: 2,
          children: [
            GestureDetector(
                onTap: () {
                  Get.to(() => ManagerListPage());
                },
                child: Container(
                  child: const DashboardTile(
                      text: "Manager", icon: Icons.calendar_month_outlined),
                )),
            GestureDetector(
                onTap: () {
                  Get.to(() => BrokerListPage());
                },
                child: const DashboardTile(
                    text: "Brokers",
                    icon: Icons.account_balance_wallet_outlined)),
            GestureDetector(
                onTap: () {
                  Get.to(() => ManagerListPage());
                },
                child: const DashboardTile(
                    text: "Staff", icon: Icons.storefront_outlined)),
            GestureDetector(
                onTap: () {
                  Get.to(() => TeamPage());
                },
                child: const DashboardTile(
                    text: "Partners", icon: Icons.workspace_premium_outlined)),
          ],
        ),
      );
}
