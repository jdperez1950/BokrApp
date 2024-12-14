import 'package:brokr/ui/guest/fragments/filters/boat_filter.dart';
import 'package:brokr/ui/guest/fragments/filters/car_filter.dart';
import 'package:brokr/ui/guest/fragments/filters/stay_filter.dart';
import 'package:brokr/ui/guest/fragments/filters/yatch_filter.dart';
import 'package:brokr/ui/guest/fragments/map_explora_fragment.dart';
import 'package:brokr/ui/widgets/filter_car_view.dart';
import 'package:brokr/ui/widgets/icon_radio_button.dart';
import 'package:brokr/ui/widgets/input_field.dart';
import 'package:brokr/ui/widgets/item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../utils/theme_utils.dart';
import '../../widgets/gradient_button.dart';

class ExploreFragment extends StatefulWidget {
  const ExploreFragment({super.key});

  @override
  State createState() => _ExploreFragment();
}

class _ExploreFragment extends State<ExploreFragment> {
  final PageController controller = PageController();
  final _duration = const Duration(milliseconds: 300);
  bool _showFab = true;
  int _groupValue = 0;
  bool _showMap = false;
  Function(Function())? _sheetState;

  final _sortCarItems = [
    'Relevance',
    'Price (Low to High)',
    'Price (High to Low)',
    'Newest',
    'Oldest',
  ];

  final _filters = [
    const FilterCarWidget(),
    const FilterStayWidget(),
    const FilterYachtWidget(),
    const FilterBoatWidget(),
  ];

  String? _sortCarValue;

  //Price Range
  RangeValues _currentRangeValues = const RangeValues(100, 500);

  //Unlimited miles params
  bool _unlimitedMiles = false;

  _onUnlimitedMilesChanged(bool? value) {
    setState(() {
      _unlimitedMiles = value!;
      _sheetState!(() {});
    });
  }

  _onSortCarChanged(String? value) {
    setState(() {
      _sortCarValue = value;
      _sheetState!(() {});
    });
  }

  _onPriceRangeChanged(RangeValues values) {
    setState(() {
      _currentRangeValues = values;
      _sheetState!(() {});
    });
  }

  _buildView() {
    return PageView(
      controller: controller,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            final ScrollDirection direction = notification.direction;
            setState(() {
              if (direction == ScrollDirection.reverse) {
                _showFab = false;
              } else if (direction == ScrollDirection.forward) {
                _showFab = true;
              }
            });
            return true;
          },
          child: ListView.builder(
            padding: const EdgeInsets.only(top: 250, left: 16, right: 16),
            itemCount: 4,
            itemBuilder: (_, i) {
              String image;
              switch (_groupValue) {
                case 3:
                  image =
                      'https://media.gettyimages.com/id/153642886/es/foto/alegre-joven-montando-en-un-bote.jpg?s=612x612&w=gi&k=20&c=y4eBMQQokoc1euCgwfqWsXM5QhODmdAWVoKopWuQYTE=';
                  break;
                case 2:
                  image =
                      'https://static4.depositphotos.com/1000129/313/i/950/depositphotos_3139714-stock-photo-motor-yatch.jpg';
                  break;
                case 1:
                  image =
                      'https://cf.bstatic.com/xdata/images/hotel/max1024x768/271619464.jpg?k=9b269183149ff60cf826037d01b57c1091d2be5ac2e0f091a76ab48eaee0f987&o=&hp=1';
                  break;
                case 0:
                default:
                  image =
                      'https://imageio.forbes.com/specials-images/imageserve/6064c6802c761b99a89d1f21/0x0.jpg?format=jpg&crop=2375,1336,x0,y120,safe&width=1200';
                  break;
              }
              return ItemCard(
                title: 'Luxury Villa 5bed/6bath waterfront',
                address: 'Miami Beach Florida, United States',
                rating: 4.5,
                image: image,
                price: 7490,
                price2: 7899,
                isFavourite: i == 0,
                margin: const EdgeInsets.only(bottom: 20),
              );
            },
          ),
        ),
        const MapExploreFragment()
      ],
    );
    // if (_showMap) {
    //   return const MapExploreFragment();
    // } else {
    //   return NotificationListener<UserScrollNotification>(
    //     onNotification: (notification) {
    //       final ScrollDirection direction = notification.direction;
    //       setState(() {
    //         if (direction == ScrollDirection.reverse) {
    //           _showFab = false;
    //         } else if (direction == ScrollDirection.forward) {
    //           _showFab = true;
    //         }
    //       });
    //       return true;
    //     },
    //     child: ListView.builder(
    //       padding: const EdgeInsets.only(top: 250, left: 16, right: 16),
    //       itemCount: 4,
    //       itemBuilder: (_, i) {
    //         String image;
    //         switch (_groupValue) {
    //           case 3:
    //             image =
    //                 'https://media.gettyimages.com/id/153642886/es/foto/alegre-joven-montando-en-un-bote.jpg?s=612x612&w=gi&k=20&c=y4eBMQQokoc1euCgwfqWsXM5QhODmdAWVoKopWuQYTE=';
    //             break;
    //           case 2:
    //             image =
    //                 'https://static4.depositphotos.com/1000129/313/i/950/depositphotos_3139714-stock-photo-motor-yatch.jpg';
    //             break;
    //           case 1:
    //             image =
    //                 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/271619464.jpg?k=9b269183149ff60cf826037d01b57c1091d2be5ac2e0f091a76ab48eaee0f987&o=&hp=1';
    //             break;
    //           case 0:
    //           default:
    //             image =
    //                 'https://imageio.forbes.com/specials-images/imageserve/6064c6802c761b99a89d1f21/0x0.jpg?format=jpg&crop=2375,1336,x0,y120,safe&width=1200';
    //             break;
    //         }
    //         return ItemCard(
    //           title: 'Luxury Villa 5bed/6bath waterfront',
    //           address: 'Miami Beach Florida, United States',
    //           rating: 4.5,
    //           image: image,
    //           price: 7490,
    //           price2: 7899,
    //           isFavourite: i == 0,
    //           margin: const EdgeInsets.only(bottom: 20),
    //         );
    //       },
    //     ),
    //   );
    // }
  }

  _buildFilters() {
    showMaterialModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      context: context,
      builder: (context2) => Container(
        width: MediaQuery.of(context).size.height * 0.8,
        height: MediaQuery.of(context).size.height * 0.8,
        padding: const EdgeInsets.all(32),
        child: StatefulBuilder(
          builder: (context3, setSheetState) {
            _sheetState = setSheetState;
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 75,
                    height: 6,
                    decoration: const BoxDecoration(
                      color: Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.all(Radius.circular(3)),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: _filters[_groupValue],
                  // child: FilterCarView(
                  //   sortItems: _sortCarItems,
                  //   sortSelectedValue: _sortCarValue,
                  //   onSortChanged: _onSortCarChanged,
                  //   sortHintText: 'Select',
                  //   currentRangeValues: _currentRangeValues,
                  //   onPriceChanged: _onPriceRangeChanged,
                  //   unlimitedMiles: _unlimitedMiles,
                  //   onUnlimitedMilesChanged: _onUnlimitedMilesChanged,
                  // ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 5;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/image_background.png',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          _buildView(),
          Positioned(
            top: 70,
            left: 0,
            right: 0,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.only(
                left: 20,
                top: 2,
                right: 20,
              ),
              height: 53,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x40000000),
                    offset: Offset(0, 4),
                    blurRadius: 5,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: InputField(
                hintText: 'Search cars, yachts, houses and more...',
                hintColor: Colors.black,
                icon: SvgPicture.asset(
                  'assets/icons/search_icon.svg',
                  height: 20,
                ),
                fillColor: Colors.white,
                focusedBorderColor: Colors.white,
                enabledBorderColor: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  SizedBox(
                    width: width,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: IconRadioButton2(
                        iconPath: 'assets/icons/car_icon.svg',
                        text: 'Car',
                        value: 0,
                        groupValue: _groupValue,
                        onChanged: (value) {
                          setState(() {
                            _groupValue = value;
                          });
                        },
                        borderColor: Colors.black,
                      ),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: width,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: IconRadioButton2(
                        iconPath: 'assets/icons/house_icon.svg',
                        text: 'Stay',
                        value: 1,
                        groupValue: _groupValue,
                        onChanged: (value) {
                          setState(() {
                            _groupValue = value;
                          });
                        },
                        borderColor: Colors.black,
                      ),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: width,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: IconRadioButton2(
                        iconPath: 'assets/icons/yacht_icon.svg',
                        text: 'Yacht',
                        value: 2,
                        groupValue: _groupValue,
                        onChanged: (value) {
                          setState(() {
                            _groupValue = value;
                          });
                        },
                        borderColor: Colors.black,
                      ),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: width,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: IconRadioButton2(
                        iconPath: 'assets/icons/boat_icon.svg',
                        text: 'Boat',
                        value: 3,
                        groupValue: _groupValue,
                        onChanged: (value) {
                          setState(
                            () {
                              _groupValue = value;
                            },
                          );
                        },
                        borderColor: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AnimatedSlide(
        duration: _duration,
        offset: _showFab ? Offset.zero : const Offset(0, 2),
        child: AnimatedOpacity(
          duration: _duration,
          opacity: _showFab ? 1 : 0,
          child: Container(
            height: 50,
            width: 200,
            margin: EdgeInsets.only(bottom: _showMap ? 238 : 16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: ThemeUtils.gradientButton,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(25),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _showMap = !_showMap;
                      });
                      controller.animateToPage(
                        _showMap ? 1 : 0,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          _showMap
                              ? 'assets/icons/list_icon.svg'
                              : 'assets/icons/map_icon.svg',
                          color: Colors.white,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          _showMap ? 'List' : 'Map',
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 1,
                  color: Colors.white,
                ),
                Expanded(
                  child: InkWell(
                    onTap: _buildFilters,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/icons/filter_icon.svg'),
                        const SizedBox(width: 10),
                        Text(
                          'Filter',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: Colors.white, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
