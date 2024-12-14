import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../utils/theme_utils.dart';
import '../../../widgets/tiles/asset_tile_widget.dart';

class HistoryFragment extends StatelessWidget {
  List<AssetTile> assetList = [
    const AssetTile(
      owner: "Luis",
      title: "Lambo",
      endDate: 'Mon, Oct 10',
      startDate: 'Fri, Oct 07',
      status: "verified",
      imagePath:
          'https://imageio.forbes.com/specials-images/imageserve/5d35eacaf1176b0008974b54/0x0.jpg?format=jpg&crop=4560,2565,x790,y784,safe&width=1200',
    ),
    const AssetTile(
      owner: "Ray",
      title: "Lambo",
      endDate: 'Mon, Oct 10',
      startDate: 'Fri, Oct 07',
      status: "verified",
      imagePath:
          'https://imageio.forbes.com/specials-images/imageserve/6064c6802c761b99a89d1f21/0x0.jpg?format=jpg&crop=2375,1336,x0,y120,safe&width=1200',
    ),
    const AssetTile(
      owner: "Pauli",
      title: "Lambo",
      endDate: 'Mon, Oct 10',
      startDate: 'Fri, Oct 07',
      status: "Verified",
      imagePath:
          'https://imageio.forbes.com/specials-images/imageserve/5d35eacaf1176b0008974b54/0x0.jpg?format=jpg&crop=4560,2565,x790,y784,safe&width=1200',
    ),
    const AssetTile(
      owner: "Paul",
      title: "Lambo",
      endDate: 'Mon, Oct 10',
      startDate: 'Fri, Oct 07',
      status: "Verified",
      imagePath:
          'https://imageio.forbes.com/specials-images/imageserve/5f962d31e7b04bbfd2f68758/Bugatti-Chiron-Super-Sport-300--Driving/960x0.jpg?height=473&width=711&fit=bounds',
    ),
  ].reversed.toList();

  final _duration = const Duration(milliseconds: 300);
  bool _showFab = true;
  @override
  Widget build(BuildContext context) => Scaffold(
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
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/list_icon.svg',
                            color: Colors.white,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'Add',
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(color: Colors.white, fontSize: 14),
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
                      onTap: () {},
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
        body: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: assetList.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: Center(child: assetList[index]),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              color: Colors.black,
              indent: 40,
              endIndent: 40,
            );
          },
        ),
      );
}
