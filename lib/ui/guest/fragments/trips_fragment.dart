import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/icon_radio_button.dart';
import 'trips/bookedFragment.dart';
import 'trips/historyFragment.dart';
import 'trips/requestsFragment.dart';

class TripsFragment extends StatefulWidget {
  const TripsFragment({super.key});

  @override
  _TripsFragmentState createState() => _TripsFragmentState();
}

class _TripsFragmentState extends State<TripsFragment> {
  int groupValue = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                elevation: 0,
                centerTitle: false,
                title: const Text(
                  'Trips',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                backgroundColor: Colors.white,
                bottom: const TabBar(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  indicatorColor: Colors.black,
                  labelColor: Colors.black,
                  tabs: [
                    Tab(text: 'Booked'),
                    Tab(text: 'Pending'),
                    Tab(text: 'History'),
                  ],
                ),
                // bottom: PreferredSize(
                //   preferredSize: const Size.fromHeight(80.0),
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     children: [
                //       SizedBox(
                //         height: 20,
                //       ),
                //       Container(
                //         margin: const EdgeInsets.symmetric(horizontal: 20),
                //         child: Row(
                //           children: [
                //             Expanded(
                //               child: IconRadioButton2(
                //                 borderColor: Colors.black,
                //                 iconPath: 'assets/icons/car_icon.png',
                //                 text: 'Car',
                //                 value: 0,
                //                 groupValue: groupValue,
                //                 onChanged: (value) {
                //                   setState(() {
                //                     groupValue = value;
                //                   });
                //                 },
                //               ),
                //             ),
                //             const SizedBox(width: 20),
                //             Expanded(
                //               child: IconRadioButton2(
                //                 borderColor: Colors.black,
                //                 iconPath: 'assets/icons/house_icon.png',
                //                 text: 'Stay',
                //                 value: 1,
                //                 groupValue: groupValue,
                //                 onChanged: (value) {
                //                   setState(() {
                //                     groupValue = value;
                //                   });
                //                 },
                //               ),
                //             ),
                //             const SizedBox(width: 20),
                //             Expanded(
                //               child: IconRadioButton2(
                //                 borderColor: Colors.black,
                //                 iconPath: 'assets/icons/yacht_icon.png',
                //                 text: 'Yacht',
                //                 value: 2,
                //                 groupValue: groupValue,
                //                 onChanged: (value) {
                //                   setState(() {
                //                     groupValue = value;
                //                   });
                //                 },
                //               ),
                //             ),
                //             const SizedBox(width: 20),
                //             Expanded(
                //               child: IconRadioButton2(
                //                 borderColor: Colors.black,
                //                 iconPath: 'assets/icons/boat_icon.png',
                //                 text: 'Boat',
                //                 value: 3,
                //                 groupValue: groupValue,
                //                 onChanged: (value) {
                //                   setState(() {
                //                     groupValue = value;
                //                   });
                //                 },
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //       TabBar(
                //         indicatorColor: Colors.black,
                //         labelColor: Colors.black,
                //         tabs: [
                //           Tab(text: 'Booked'),
                //           Tab(text: 'Requests'),
                //           Tab(text: 'History'),
                //         ],
                //       ),
                //     ],
                //   ),
                // ),
              ),
              body: TabBarView(
                children: [
                  const BookedFragment(),
                  RequestsFragment(),
                  HistoryFragment()
                ],
              ),
            )),
      );
}
