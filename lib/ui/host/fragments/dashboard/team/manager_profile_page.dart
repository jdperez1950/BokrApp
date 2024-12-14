import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

import 'package:get/get.dart';

import '../../../../../controllers/managerController.dart';
import '../../../../widgets/columnBuilderWidget.dart';
import '../../../../widgets/icon_widget.dart';
import '../../../../widgets/tiles/buttonTileWidget.dart';
import '../../../../widgets/tiles/managerAssetTileWidget.dart';
import 'manager_header.dart';

class ManagerPage extends StatefulWidget {
  static String name = '/manager-page';
  @override
  _ManagerPageState createState() => _ManagerPageState();
}

class _ManagerPageState extends State<ManagerPage> {
  static const key0 = 'key-0';
  static const key2 = 'key-1';
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
                ManagerHeaderPage(),
                IconButton(
                  iconSize: 20,
                  icon: const Icon(
                    Icons.calendar_today,
                  ),
                  onPressed: () {
                    setState(
                      () {
                        _settings = !_settings;
                      },
                    );
                  },
                ),
              ]),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  const begin = Offset(-1, 0);
                  const end = Offset.zero;
                  final tween = Tween(begin: begin, end: end);
                  final offsetAnimation = animation.drive(tween);
                  return SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  );
                },
                child: _settings
                    ? Expanded(
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buildManageBooking(),
                          buildModifyListing(),
                          buildAddListings(),
                          buildModifyPricing(),
                          buildAddBroker()
                        ],
                      ))
                    : Expanded(
                        child: ListView(shrinkWrap: true, children: [
                        Container(
                          alignment: Alignment.center,
                          child: ToggleButtons(
                              renderBorder: false,
                              fillColor: Colors.white,
                              onPressed: (int index) {
                                setState(() {
                                  for (int i = 0;
                                      i < _selectedAsset.length;
                                      i++) {
                                    _selectedAsset[i] = i == index;
                                  }
                                });
                              },
                              isSelected: _selectedAsset,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(0.1),
                                  child: ButtonTile(
                                      height: 75,
                                      width: 75,
                                      child: Column(
                                        children: [
                                          const Icon(Icons.car_rental),
                                          const Text("Cars")
                                        ],
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(0.1),
                                  child: ButtonTile(
                                      height: 75,
                                      width: 75,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const Icon(Icons.house_outlined),
                                          const Text(
                                            "Properties",
                                            style: TextStyle(fontSize: 10),
                                          )
                                        ],
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(0.1),
                                  child: ButtonTile(
                                      height: 75,
                                      width: 75,
                                      child: Column(
                                        children: [
                                          const Icon(Icons.car_rental),
                                          const Text("Boats")
                                        ],
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(0.1),
                                  child: ButtonTile(
                                      height: 75,
                                      width: 75,
                                      child: Column(
                                        children: [
                                          const Icon(Icons.car_rental),
                                          const Text("Yacht")
                                        ],
                                      )),
                                )
                              ]),
                        ),
                        ColumnBuilder(
                            itemCount: assetList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                child: Center(child: assetList[index]),
                              );
                            }),
                      ])),
              ),
            ],
          ),
        ),
      ));

  Widget buildManageBooking() => SwitchSettingsTile(
        settingKey: key0,
        leading: IconWidget(
          icon: Icons.dark_mode,
          color: Colors.white,
        ),
        title: 'Manage & modify bookings',
        onChange: (_) {},
      );
  Widget buildModifyListing() => SwitchSettingsTile(
        settingKey: key2,
        leading: IconWidget(
          icon: Icons.dark_mode,
          color: Colors.white,
        ),
        title: 'Modify listing',
        onChange: (_) {},
      );
  Widget buildAddListings() => SwitchSettingsTile(
        settingKey: key3,
        leading: IconWidget(
          icon: Icons.dark_mode,
          color: Colors.white,
        ),
        title: 'Add listings',
        onChange: (_) {},
      );
  Widget buildModifyPricing() => SwitchSettingsTile(
        settingKey: key4,
        leading: IconWidget(
          icon: Icons.dark_mode,
          color: Colors.white,
        ),
        title: 'Modify pricing ',
        onChange: (_) {},
      );

  Widget buildAddBroker() => SwitchSettingsTile(
        settingKey: key5,
        leading: IconWidget(
          icon: Icons.dark_mode,
          color: Colors.white,
        ),
        title: 'Add brokers & team members',
        onChange: (_) {},
      );
}
