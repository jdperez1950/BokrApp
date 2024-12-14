import 'package:brokr/ui/guest/fragments/explore_fragment.dart';
import 'package:brokr/ui/host/fragments/dashboardPage.dart';
import 'package:flutter/material.dart';

import '../guest/fragments/chat_fragment.dart';
import '../guest/fragments/favorites_fragment.dart';
import '../guest/fragments/profile_fragment.dart';
import '../guest/fragments/trips_fragment.dart';
import '../widgets/bottom_bar_widget.dart';

class BrokerHomePage extends StatefulWidget {
  static String name = '/broker-home-page';

  const BrokerHomePage({Key? key}) : super(key: key);

  @override
  State createState() => _BrokerHomePageState();
}

class _BrokerHomePageState extends State<BrokerHomePage>
    with TickerProviderStateMixin {
  final List<String> _labelFragments = [
    'Explore',
    'Favorite',
    'Trips',
    'Inbox',
    'Profile',
  ];

  final _iconFragments = [
    'assets/icons/search_icon.svg',
    'assets/icons/favorite_icon.svg',
    'assets/icons/trip_icon.svg',
    'assets/icons/inbox_icon.svg',
    'assets/icons/profile_icon.svg',
  ];

  final _countNewNotifications = 0;

  var _index = 0;
  late TabController _tabController;

  Widget _buildContent() {
    switch (_index) {
      case 0:
        return const ExploreFragment();
      case 1:
        return const FavoritesFragment();
      case 2:
        return const TripsFragment();
      case 3:
        return const ChatFragment();
      case 4:
        return ProfileFragment();
      default:
        return Container();
    }
  }

  @override
  void initState() {
    _tabController = TabController(
      initialIndex: 0,
      length: _labelFragments.length,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContent(),
      bottomNavigationBar: BottomBarWidget(
        labels: _labelFragments,
        iconsPath: _iconFragments,
        index: _index,
        countNotifications: _countNewNotifications,
        onTabItemSelected: (int value) {
          setState(() {
            _index = value;
            _tabController.index = value;
          });
        },
      ),
    );
  }
}
