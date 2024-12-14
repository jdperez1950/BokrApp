import 'package:brokr/controllers/test_controller.dart';
import 'package:brokr/models/user_model.dart';
import 'package:brokr/ui/broker/broker_home_page.dart';
import 'package:brokr/ui/guest/fragments/explore_fragment.dart';
import 'package:brokr/ui/guest/pages/guest_home_page.dart';
import 'package:brokr/ui/host/pages/host_home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/bottom_bar_widget.dart';

class HomePage extends StatefulWidget {
  static String name = '/home-page';

  const HomePage({Key? key}) : super(key: key);

  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final controller = Get.put(TestController());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return controller.session == 'Host'
        ? const HostHomePage()
        : controller.session == 'Broker'
            ? const BrokerHomePage()
            : const GuestHomePage();
  }
}
