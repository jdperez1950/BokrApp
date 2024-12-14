import 'package:brokr/ui/host/fragments/dashboard/listings/calendarListingsFragment.dart';
import 'package:brokr/ui/host/fragments/dashboard/listings/cancellationPolicyFragment.dart';
import 'package:brokr/ui/host/fragments/dashboard/listings/detailsListingsFragment.dart';
import 'package:brokr/ui/host/fragments/dashboard/listings/guestInstructionsFragment.dart';
import 'package:brokr/ui/host/fragments/dashboard/listings/houseRulesListingsFragment.dart';
import 'package:brokr/ui/host/fragments/dashboard/listings/locationListingFragment.dart';
import 'package:brokr/ui/host/fragments/dashboard/listings/photosListingsFragment.dart';
import 'package:brokr/ui/host/fragments/dashboard/listings/pricingListingsFragment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import '../../../../widgets/icon_widget.dart';

import 'headerListingsFragment.dart';
import 'listedListingsFragment.dart';

const List<String> list = <String>['Guest', 'Host', 'Brokr'];

class ListingsSettingsFragment extends StatefulWidget {
  static String name = '/listing-settings';

  @override
  _ListingsSettingsFragmentState createState() =>
      _ListingsSettingsFragmentState();
}

class _ListingsSettingsFragmentState extends State<ListingsSettingsFragment> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: ListView(
          children: [
            HeaderListingsFragment(),
            SizedBox(
              child: SettingsGroup(
                title: 'Your Listing',
                children: <Widget>[
                  CalendarListingsFragment(),
                  PricingListingsFragment(),
                  LocationListingsFragment(),
                  PhotosListingsFragment(),
                  DetailsListingsFragment(),
                  GuestInstructionsFragment(),
                  HouseRulesFragment(),
                  CancellationPolicyFragment(),
                  ListedListingsFragment()
                ],
              ),
            )
          ],
        ),
      );
}

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
