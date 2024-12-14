import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:toggle_switch/toggle_switch.dart';
import '../../../widgets/lineGraphWidget.dart';
import '../../../widgets/pieGraphWidget.dart';
import '../../../widgets/tiles/buttonTileWidget.dart';
import '../../../widgets/tiles/tile_widget.dart';

class FinancePage extends StatefulWidget {
  //final controller = Get.put(FinancePageController());

  @override
  _FinanceStatePage createState() => _FinanceStatePage();
}

class _FinanceStatePage extends State<FinancePage> {
  var _selectedIndex = 0;
  final List<bool> _selectedAsset = <bool>[true, false, false, false];
  final List<bool> _selectedPeriod = <bool>[true, false, false, false];
  final List<bool> _selectedPie = <bool>[true, false];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          title: const Text(
            'Finance',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // ToggleText(
              //     width: 300,
              //     height: 40,
              //     toggleBackgroundColor: Colors.white,
              //     toggleBorderColor: Colors.grey,
              //     toggleColor: Colors.purple,
              //     activeTextColor: Colors.white,
              //     inactiveTextColor: Colors.grey,
              //     leftDescription: "Earnings",
              //     rightDescription: "Expenses",
              //     onLeftToggleActive: () {},
              //     onRightToggleActive: () {}),
              ToggleSwitch(
                minWidth: 150.0,
                minHeight: 40,
                cornerRadius: 20.0,
                activeBgColors: [
                  [Colors.purple],
                  [Colors.purple]
                ],
                activeFgColor: Colors.white,
                inactiveBgColor: Colors.white,
                inactiveFgColor: Colors.grey,
                borderColor: [Colors.grey],
                borderWidth: 0.5,
                initialLabelIndex: _selectedIndex,
                totalSwitches: 2,
                labels: ['Earnings', 'Expenses'],
                radiusStyle: true,
                onToggle: (index) {
                  setState(() {
                    for (int i = 0; i < _selectedPie.length; i++) {
                      _selectedPie[i] = i == index;
                      print(_selectedPie[0]);
                    }
                    _selectedIndex = index!;
                  });
                },
              ),

              /////////////////////////////////////////////////////////////////////////////////////////////////////////
              _selectedPie[0]
                  ? const Tile(height: 400, width: 400, child: PieGraph())
                  : const Tile(height: 400, width: 400, child: PieGraph()),

              /////////////////////////////////////////////////////////////////////////////////////////////////////////
              ToggleButtons(
                  renderBorder: false,
                  fillColor: Colors.white,
                  onPressed: (int index) {
                    setState(() {
                      for (int i = 0; i < _selectedAsset.length; i++) {
                        _selectedAsset[i] = i == index;
                      }
                    });
                  },
                  isSelected: _selectedAsset,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(0.1),
                      child: ButtonTile(
                          height: 90,
                          width: 90,
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
                          height: 90,
                          width: 90,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
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
                          height: 90,
                          width: 90,
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
                          height: 90,
                          width: 90,
                          child: Column(
                            children: [
                              const Icon(Icons.car_rental),
                              const Text("Yacht")
                            ],
                          )),
                    )
                  ]),

              /////////////////////////////////////////////////////////////////////////////////////////////////////////
              Tile(
                  height: 1000,
                  width: 400,
                  child: Column(
                    children: [
                      ToggleButtons(
                          renderBorder: false,
                          fillColor: Colors.white,
                          onPressed: (int ind) {
                            setState(() {
                              for (int j = 0; j < _selectedPeriod.length; j++) {
                                _selectedPeriod[j] = j == ind;
                              }
                            });
                          },
                          selectedColor: Colors.purple,
                          isSelected: _selectedPeriod,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(0.1),
                              child: ButtonTile(
                                  height: 50,
                                  width: 70,
                                  child: Column(
                                    children: [
                                      Text(
                                        "All",
                                        style: TextStyle(
                                            color: _selectedPeriod[0]
                                                ? Colors.purple
                                                : Colors.black),
                                      )
                                    ],
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(0.1),
                              child: ButtonTile(
                                  height: 50,
                                  width: 70,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Week",
                                        style: TextStyle(
                                            color: _selectedPeriod[1]
                                                ? Colors.purple
                                                : Colors.black),
                                      )
                                    ],
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(0.1),
                              child: ButtonTile(
                                  height: 50,
                                  width: 70,
                                  child: Column(
                                    children: [
                                      Text(
                                        "Month",
                                        style: TextStyle(
                                            color: _selectedPeriod[2]
                                                ? Colors.purple
                                                : Colors.black),
                                      )
                                    ],
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(0.1),
                              child: ButtonTile(
                                  height: 50,
                                  width: 70,
                                  child: Column(
                                    children: [
                                      Text(
                                        "Year",
                                        style: TextStyle(
                                            color: _selectedPeriod[3]
                                                ? Colors.purple
                                                : Colors.black),
                                      )
                                    ],
                                  )),
                            )
                          ]),

                      /////////////////////////////////////////////////////////////////////////////////////////////////////////
                      _selectedAsset.indexOf(true) == 0
                          ? Column(
                              children: [
                                const Text("car"),
                                _selectedPeriod.indexOf(true) == 0
                                    ? Column(children: [
                                        const Text("All"),
                                        LineGraph()
                                      ])
                                    : Container(),
                                _selectedPeriod.indexOf(true) == 1
                                    ? Column(children: [
                                        const Text("Week"),
                                        LineGraph()
                                      ])
                                    : Container(),
                                _selectedPeriod.indexOf(true) == 2
                                    ? Column(children: [
                                        const Text("Month"),
                                        LineGraph()
                                      ])
                                    : Container(),
                                _selectedPeriod.indexOf(true) == 3
                                    ? Column(children: [
                                        const Text("Year"),
                                        LineGraph()
                                      ])
                                    : Container(),
                              ],
                            )
                          : Container(),

                      _selectedAsset.indexOf(true) == 1
                          ? Column(
                              children: [
                                const Text("properties"),
                                _selectedPeriod.indexOf(true) == 0
                                    ? Column(children: [
                                        const Text("All"),
                                        LineGraph()
                                      ])
                                    : Container(),
                                _selectedPeriod.indexOf(true) == 1
                                    ? Column(children: [
                                        const Text("Week"),
                                        LineGraph()
                                      ])
                                    : Container(),
                                _selectedPeriod.indexOf(true) == 2
                                    ? Column(children: [
                                        const Text("Month"),
                                        LineGraph()
                                      ])
                                    : Container(),
                                _selectedPeriod.indexOf(true) == 3
                                    ? Column(children: [
                                        const Text("Year"),
                                        LineGraph()
                                      ])
                                    : Container(),
                              ],
                            )
                          : Container(),

                      _selectedAsset.indexOf(true) == 2
                          ? Column(
                              children: [
                                const Text("boats"),
                                _selectedPeriod.indexOf(true) == 0
                                    ? Column(children: [
                                        const Text("All"),
                                        LineGraph()
                                      ])
                                    : Container(),
                                _selectedPeriod.indexOf(true) == 1
                                    ? Column(children: [
                                        const Text("Week"),
                                        LineGraph()
                                      ])
                                    : Container(),
                                _selectedPeriod.indexOf(true) == 2
                                    ? Column(children: [
                                        const Text("Month"),
                                        LineGraph()
                                      ])
                                    : Container(),
                                _selectedPeriod.indexOf(true) == 3
                                    ? Column(children: [
                                        const Text("Year"),
                                        LineGraph()
                                      ])
                                    : Container(),
                              ],
                            )
                          : Container(),

                      _selectedAsset.indexOf(true) == 3
                          ? Column(
                              children: [
                                const Text("yacht"),
                                _selectedPeriod.indexOf(true) == 0
                                    ? Column(children: [
                                        const Text("All"),
                                        LineGraph()
                                      ])
                                    : Container(),
                                _selectedPeriod.indexOf(true) == 1
                                    ? Column(children: [
                                        const Text("Week"),
                                        LineGraph()
                                      ])
                                    : Container(),
                                _selectedPeriod.indexOf(true) == 2
                                    ? Column(children: [
                                        const Text("Month"),
                                        LineGraph()
                                      ])
                                    : Container(),
                                _selectedPeriod.indexOf(true) == 3
                                    ? Column(children: [
                                        const Text("Year"),
                                        LineGraph()
                                      ])
                                    : Container(),
                              ],
                            )
                          : Container(),

                      /////////////////////////////////////////////////////////////////////////////////////////////////////////
                    ],
                  )),
            ],
          ),
        ),
      );
}
