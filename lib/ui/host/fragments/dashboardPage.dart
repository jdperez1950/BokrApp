import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';

import '../../widgets/dashboard_tile_widget.dart';
import 'dashboard/availabilityPage.dart';
import 'dashboard/bookingsPage.dart';
import 'dashboard/dashSettings.dart';
import 'dashboard/documentsPage.dart';
import 'dashboard/financePage.dart';
import 'dashboard/listingsPage.dart';
import 'dashboard/teamPage.dart';

class DashboardFragment extends StatefulWidget {
  const DashboardFragment({super.key});
  //TODO: cambiar a un enum que genere los dashboardTile

  @override
  _DashboardFragmentState createState() => _DashboardFragmentState();
}

class _DashboardFragmentState extends State<DashboardFragment> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: false,
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            'Dashboard',
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
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
                  Get.to(() => BookingsPage());
                },
                child: Container(
                  child: const DashboardTile(
                      text: "Bookings", icon: Icons.calendar_month_outlined),
                )),
            GestureDetector(
                onTap: () {
                  //Get.to(() => FinancePage());
                },
                child: const DashboardTile(
                    text: "Finance",
                    icon: Icons.account_balance_wallet_outlined)),
            GestureDetector(
                onTap: () {
                  Get.to(() => ListingsPage());
                },
                child: const DashboardTile(
                    text: "Listings", icon: Icons.storefront_outlined)),
            GestureDetector(
                onTap: () {
                  Get.to(() => TeamPage());
                },
                child: const DashboardTile(
                    text: "Team", icon: Icons.workspace_premium_outlined)),
            GestureDetector(
                onTap: () {
                  Get.to(() => DocumentsPage());
                },
                child: const DashboardTile(
                    text: "Documents", icon: Icons.folder_outlined)),
            GestureDetector(
                onTap: () {
                  //Get.to(FinancePage());
                },
                child: const DashboardTile(
                    text: "Clients", icon: Icons.groups_outlined)),
            GestureDetector(
                onTap: () {
                  Get.to(DashSettingsPage());
                },
                child: const DashboardTile(
                    text: "Settings", icon: Icons.folder_outlined)),
            GestureDetector(
                onTap: () {
                  Get.to(AvailabilityPage());
                },
                child: const DashboardTile(
                    text: "Availability", icon: Icons.lock_clock_outlined))
          ],
        ),
      );
}
