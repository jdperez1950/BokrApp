import 'package:brokr/ui/host/fragments/dashboard/listings/listingSettings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/tiles/buttonTileWidget.dart';
import '../../../widgets/tiles/listingTile.dart';

class ListingsPage extends StatefulWidget {
  //final controller = Get.put(ListingsPageController());

  @override
  _ListingsPageState createState() => _ListingsPageState();
}

class _ListingsPageState extends State<ListingsPage> {
  final List<bool> _selectedAsset = <bool>[true, false, false, false];
  var _isGridSelected = true;

  List<ListingTile> listingsList = [
    const ListingTile(
      title: "Beautiful Villa 5bed/6bath",
      location: "Miami Beach, Florida, USA",
      price: "1200",
      discount: false,
      discPrice: "900",
      timeUnit: "night",
      rating: "5.0",
      image:
          'https://i.pinimg.com/originals/c7/58/43/c7584365f991ea6236fd1f19653f06a2.jpg',
      height: 170,
      width: 200,
    ),
    const ListingTile(
      title: "Beautiful Villa 5bed/6bath",
      location: "Miami Beach, Florida, USA",
      price: "1200",
      discount: false,
      discPrice: "900",
      timeUnit: "night",
      rating: "5.0",
      image:
          'https://i.pinimg.com/originals/c7/58/43/c7584365f991ea6236fd1f19653f06a2.jpg',
      height: 170,
      width: 200,
    ),
    const ListingTile(
      title: "Beautiful Villa 5bed/6bath",
      location: "Miami Beach, Florida, USA",
      price: "1200",
      discount: false,
      discPrice: "900",
      timeUnit: "night",
      rating: "5.0",
      image:
          'https://i.pinimg.com/originals/c7/58/43/c7584365f991ea6236fd1f19653f06a2.jpg',
      height: 170,
      width: 200,
    ),
    const ListingTile(
      title: "Beautiful Villa 5bed/6bath",
      location: "Miami Beach, Florida, USA",
      price: "1200",
      discount: false,
      discPrice: "900",
      timeUnit: "night",
      rating: "5.0",
      image:
          'https://i.pinimg.com/originals/c7/58/43/c7584365f991ea6236fd1f19653f06a2.jpg',
      height: 170,
      width: 200,
    ),
    const ListingTile(
      title: "Beautiful Villa 5bed/6bath",
      location: "Miami Beach, Florida, USA",
      price: "1200",
      discount: false,
      discPrice: "900",
      timeUnit: "night",
      rating: "5.0",
      image:
          'https://i.pinimg.com/originals/c7/58/43/c7584365f991ea6236fd1f19653f06a2.jpg',
      height: 170,
      width: 200,
    )
  ];

  List<ListingTile> listingsViewList = [
    const ListingTile(
      title: "Beautiful Villa 5bed/6bath",
      location: "Miami Beach, Florida, USA",
      price: "1200",
      discount: false,
      discPrice: "900",
      timeUnit: "night",
      rating: "5.0",
      image:
          'https://i.pinimg.com/originals/c7/58/43/c7584365f991ea6236fd1f19653f06a2.jpg',
      height: 200,
      width: 300,
    ),
    const ListingTile(
      title: "Beautiful Villa 5bed/6bath",
      location: "Miami Beach, Florida, USA",
      price: "1200",
      discount: false,
      discPrice: "900",
      timeUnit: "night",
      rating: "5.0",
      image:
          'https://i.pinimg.com/originals/c7/58/43/c7584365f991ea6236fd1f19653f06a2.jpg',
      height: 200,
      width: 300,
    ),
    const ListingTile(
      title: "Beautiful Villa 5bed/6bath",
      location: "Miami Beach, Florida, USA",
      price: "1200",
      discount: false,
      discPrice: "900",
      timeUnit: "night",
      rating: "5.0",
      image:
          'https://i.pinimg.com/originals/c7/58/43/c7584365f991ea6236fd1f19653f06a2.jpg',
      height: 200,
      width: 300,
    ),
    const ListingTile(
      title: "Beautiful Villa 5bed/6bath",
      location: "Miami Beach, Florida, USA",
      price: "1200",
      discount: false,
      discPrice: "900",
      timeUnit: "night",
      rating: "5.0",
      image:
          'https://i.pinimg.com/originals/c7/58/43/c7584365f991ea6236fd1f19653f06a2.jpg',
      height: 200,
      width: 300,
    ),
    const ListingTile(
      title: "Beautiful Villa 5bed/6bath",
      location: "Miami Beach, Florida, USA",
      price: "1200",
      discount: false,
      discPrice: "900",
      timeUnit: "night",
      rating: "5.0",
      image:
          'https://i.pinimg.com/originals/c7/58/43/c7584365f991ea6236fd1f19653f06a2.jpg',
      height: 200,
      width: 300,
    )
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          title: const Text(
            'Listings',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Container(
            padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ToggleButtons(
                      renderBorder: false,
                      fillColor: Colors.white,
                      onPressed: (int index) {
                        setState(() {
                          // The button that is tapped is set to true, and the others to false.
                          for (int i = 0; i < _selectedAsset.length; i++) {
                            _selectedAsset[i] = i == index;
                          }
                        });
                      },
                      children: [
                        Padding(
                          padding: EdgeInsets.all(0.1),
                          child: ButtonTile(
                              height: 90,
                              width: 90,
                              child: Column(
                                children: [
                                  Icon(Icons.car_rental),
                                  Text("Cars")
                                ],
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.all(0.1),
                          child: ButtonTile(
                              height: 90,
                              width: 90,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.house_outlined),
                                  Text(
                                    "Properties",
                                    style: TextStyle(fontSize: 10),
                                  )
                                ],
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.all(0.1),
                          child: ButtonTile(
                              height: 90,
                              width: 90,
                              child: Column(
                                children: [
                                  Icon(Icons.car_rental),
                                  Text("Boats")
                                ],
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.all(0.1),
                          child: ButtonTile(
                              height: 90,
                              width: 90,
                              child: Column(
                                children: [
                                  Icon(Icons.car_rental),
                                  Text("Yacht")
                                ],
                              )),
                        )
                      ],
                      isSelected: _selectedAsset),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        iconSize: 20,
                        icon: const Icon(
                          Icons.calendar_today,
                        ),
                        onPressed: () {
                          setState(
                            () {
                              _isGridSelected = !_isGridSelected;
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  _isGridSelected
                      ? GridView.builder(
                          shrinkWrap: true,
                          itemCount: listingsList.length,
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200,
                                  childAspectRatio: 7 / 6,
                                  crossAxisSpacing: 1,
                                  mainAxisSpacing: 10),
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                                onTap: () {},
                                child: Container(child: listingsList[index]));
                          },
                        )
                      : Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              padding: const EdgeInsets.all(8),
                              itemCount: listingsViewList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                    child: GestureDetector(
                                  onTap: () {
                                    Get.toNamed(ListingsSettingsFragment.name,
                                        arguments:
                                            listingsViewList[index].title);
                                  },
                                  child: Center(child: listingsViewList[index]),
                                ));
                              })),
                ])),
      );
}
