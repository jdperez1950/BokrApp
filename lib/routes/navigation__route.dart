// ignore_for_file: constant_identifier_names

import '../ui/Listing/car/address_in.page.dart' as CarAddress;
import '../ui/Listing/car/address_in.page.dart';
import '../ui/Listing/car/car.page.dart';

import 'package:flutter/material.dart';
import '../ui/Listing/car/car_done.page.dart';
import '../ui/Listing/car/confirm_address.page.dart' as CarConfirm;
import '../ui/Listing/car/confirm_address.page.dart';
import '../ui/Listing/car/info_vim.page.dart';
import '../ui/Listing/car/manual_vin.page.dart';
import '../ui/Listing/car/scan_vin.page.dart';
import '../ui/Listing/yacht/yacht.page.dart';
import '../ui/profile/profile.page.dart';

class NavigationRoute {
  static const String SCANVIN = "/scan-vin";
  static const String INFOVIN = '/info/vin';
  static const String CARDONE = '/car-done/';
  static const String MANUALVIN = "/manual-vin";
  static const String LISTINGCAR = "/listing/car";
  static const String LISTINGYACHT = "/listing/yacht";
  static const String LISTINGINTRO = '/listing-intro';
  static const String LISTINGSELECT = '/listing-select';
  static const String LISTINGCARADDRESS = "/listing/car/address";
  static const String LISTINYACHTADDRESS = "/listing/yacht/address";
  static const String LISTINGCARCONFIRMADDRESS = "/listing/car/confirm-address";
  static const String LISTINYACHTCONFIRMADDRESS =
      "/listing/yacht/confirm-address";

  Map<String, Widget> get pages => _pages;

  final Map<String, Widget> _pages = {
    LISTINGCAR: CarPage(),
    CARDONE: CarDonePage(),
    INFOVIN: InfoVIMPage(),
    SCANVIN: ScanVinPage(),
    LISTINGYACHT: YachtPage(),
    MANUALVIN: ManualVinPage(),
    LISTINGSELECT: ProfilePage(),
    LISTINYACHTADDRESS: AddressInPage(),
    LISTINGCARADDRESS: CarAddress.AddressInPage(),
    LISTINYACHTCONFIRMADDRESS: ConfirmAddressPage(),
    LISTINGCARCONFIRMADDRESS: CarConfirm.ConfirmAddressPage(),
  };
}
