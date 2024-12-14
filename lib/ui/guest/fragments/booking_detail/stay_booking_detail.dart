import 'package:brokr/ui/widgets/booking_detail/yacht_booking_widget.dart';
import 'package:brokr/ui/widgets/gradient_button.dart';
import 'package:brokr/ui/widgets/icon_radio_button.dart';
import 'package:brokr/ui/widgets/input_field.dart';
import 'package:brokr/ui/widgets/item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../models/crew_member_model.dart';
import '../../../../models/policy_model.dart';
import '../../../../utils/theme_utils.dart';
import '../../../widgets/booking_detail/stay_booking_widget.dart';
import '../../../widgets/tiles/amenities_tile_widget.dart';
import '../../../widgets/tiles/characteristics_widget.dart';
import '../../../widgets/tiles/review_tile_widget.dart';

class StayBookingDetail extends StatefulWidget {
  const StayBookingDetail({super.key});

  @override
  State createState() => _StayBookingDetail();
}

class _StayBookingDetail extends State<StayBookingDetail> {
  final _duration = const Duration(milliseconds: 300);
  bool _showFab = true;
  int groupValue = 0;
  PolicyModel policy = PolicyModel('Friendly', 'legalStuff',
      'assets/icons/search_icon.svg', 'Oct 20, 2022', true);
  List<String> allowed = const ['Pets'];
  List<String> notAllowed = const ['Smoking'];

  CrewMember crew = const CrewMember('Pepe', 50, 4.5, 'Oct 2022',
      'https://imageio.forbes.com/specials-images/imageserve/5d35eacaf1176b0008974b54/0x0.jpg?format=jpg&crop=4560,2565,x790,y784,safe&width=1200');
  List<AmenitiesTieWidget> sampleAmenities = const [
    AmenitiesTieWidget(
        amenitie: 'amenitie', iconPath: 'assets/icons/search_icon.svg'),
    AmenitiesTieWidget(
        amenitie: 'amenitie', iconPath: 'assets/icons/search_icon.svg'),
    AmenitiesTieWidget(
        amenitie: 'amenitie', iconPath: 'assets/icons/search_icon.svg'),
    AmenitiesTieWidget(
        amenitie: 'amenitie', iconPath: 'assets/icons/search_icon.svg'),
  ];

  List<CharactersticsWidget> sampleCharacteristics = const [
    CharactersticsWidget(
        iconPath: 'assets/icons/search_icon.svg', name: "Bathroom", value: '3'),
    CharactersticsWidget(
        iconPath: 'assets/icons/search_icon.svg', name: "Bathroom", value: '3'),
    CharactersticsWidget(
        iconPath: 'assets/icons/search_icon.svg', name: "Bathroom", value: '3'),
  ];

  List<ReviewTileWidget> sampleReviews = const [
    ReviewTileWidget(
        name: 'Raymond',
        text: 'asdasd',
        image:
            'https://imageio.forbes.com/specials-images/imageserve/5d35eacaf1176b0008974b54/0x0.jpg?format=jpg&crop=4560,2565,x790,y784,safe&width=1200',
        date: 'Oct 20, 2022',
        id: '123',
        rating: 3.5)
  ];
  //// nav to checkout
  onPressContinue() {}
  messageHost() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            children: [
              StayBookingWidget(
                title: 'Luxury Villa 5bed/6bath waterfront',
                owner: "Luis",
                address: 'Miami Beach Florida, United States',
                rating: 4.5,
                image: 'https://picsum.photos/500',
                price: 7490,
                price2: 7899,
                isFavourite: true,
                margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                bath: 4,
                bed: 4,
                description: "asdsadsads",
                startDate: 'Sat, Oct 08, 10:30 AM',
                endDate: 'Sat, Oct 08, 10:30 AM',
                guests: 15,
                policy: policy,
                crew: crew,
                allowed: allowed,
                notAllowed: notAllowed,
                amenities: sampleAmenities,
                characteristics: sampleCharacteristics,
                reviews: sampleReviews,
                onPressContinue: () {
                  onPressContinue();
                },
                messageHost: () {
                  messageHost();
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
