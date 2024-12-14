import 'package:brokr/ui/widgets/gradient_button.dart';
import 'package:brokr/ui/widgets/icon_radio_button.dart';
import 'package:brokr/ui/widgets/input_field.dart';
import 'package:brokr/ui/widgets/item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../models/policy_model.dart';
import '../../../../utils/theme_utils.dart';
import '../../../widgets/chekout/car_checkout_widget.dart';
import '../../../widgets/chekout/stay_checkout_widget.dart';
import '../../../widgets/chekout/yacht_checkout_widget.dart';

class CarCheckout extends StatefulWidget {
  const CarCheckout({super.key});

  @override
  State createState() => _CarCheckout();
}

class _CarCheckout extends State<CarCheckout> {
  final _duration = const Duration(milliseconds: 300);
  bool _showFab = true;
  int groupValue = 0;
  PolicyModel policy = PolicyModel('Friendly', 'legalStuff',
      'assets/icons/search_icon.svg', 'Oct 20, 2022', true);

//// request book
  requestBooking() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            children: [
              CarCheckoutWidget(
                title: 'Luxury Villa 5bed/6bath waterfront',
                owner: "Luis",
                rating: 4.5,
                image: 'https://picsum.photos/500',
                margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                description: "asdsadsads",
                startDate: 'Sat, Oct 08, 10:30 AM',
                endDate: 'Sat, Oct 08, 10:30 AM',
                guests: 15,
                brokrFee: 10.0,
                gratuity: 15,
                days: 3,
                tax: 9.5,
                dayPrice: 500,
                lateFee: 600,
                policy: policy,
                requestBook: requestBooking,
              )
            ],
          ),
        ],
      ),
    );
  }
}
