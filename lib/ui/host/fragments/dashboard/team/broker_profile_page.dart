import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

import 'package:get/get.dart';

import '../../../../../controllers/managerController.dart';
import '../../../../widgets/tiles/managerAssetTileWidget.dart';
import 'broker_header.dart';

class BrokerPage extends StatefulWidget {
  static String name = '/broker-page';

  const BrokerPage({super.key});
  @override
  _BrokerPageState createState() => _BrokerPageState();
}

class _BrokerPageState extends State<BrokerPage> {
  static const keyDarkMode = 'key';
  static const key2 = 'key1';
  static const key3 = 'key-2';
  static const key4 = 'key-3';
  static const key5 = 'key-4';
  static const key6 = 'key-5';
  final controller = Get.put(ManagerController());
  final List<bool> _selectedAsset = <bool>[true, false, false, false];
  var args = Get.arguments;
  var _settings = false;

  List<ManagerAssetTile> assetList = [
    const ManagerAssetTile(
      owner: "Luis",
      title: "Lambo",
      dates: "Next Trip: june 10 - june 12",
      image: "Verified",
    ),
    const ManagerAssetTile(
      owner: "Ray",
      title: "Lambo",
      dates: "Next Trip: june 10 - june 12",
      image: "Verified",
    ),
    const ManagerAssetTile(
      owner: "Pauli",
      title: "Lambo",
      dates: "Next Trip: june 10 - june 12",
      image: "Verified",
    ),
  ].reversed.toList();

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          title: args != null
              ? Text('$args', style: TextStyle(color: Colors.black))
              : const Text('')),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                BrokerHeaderPage(),
              ]),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildLocation(),
                  buildLanguages(),
                  buildLevel(),
                  buildReviews()
                ],
              )
            ],
          ),
        ),
      ));

  Widget buildLocation() {
    return Container();
  }

  Widget buildLanguages() {
    return Container();
  }

  Widget buildLevel() {
    return Container();
  }

  Widget buildReviews() {
    return Container();
  }
}
