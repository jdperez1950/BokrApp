// ignore_for_file: depend_on_referenced_packageschangeGroupal
import 'dart:async';
import 'package:brokr/ui/guest/fragments/settings/credits_fragment.dart';
import 'package:brokr/ui/guest/fragments/settings/language_fragment.dart';
import 'package:brokr/ui/guest/fragments/settings/notifications_fragment.dart';
import 'package:brokr/ui/guest/fragments/settings/payments_fragment.dart';
import 'package:brokr/ui/guest/fragments/settings/personal_fragment.dart';
import 'package:brokr/ui/guest/fragments/settings/privacy_fragment.dart';
import 'package:brokr/ui/guest/fragments/settings/refer_fragment.dart';
import 'package:brokr/ui/guest/fragments/settings/support_fragment.dart';
import 'package:brokr/ui/guest/fragments/settings/terms_fragment.dart';
import 'package:brokr/ui/host/fragments/dashboard/listings/listingSettings.dart';
import 'package:brokr/ui/host/fragments/dashboard/team/broker_profile_page.dart';
import 'package:brokr/ui/host/fragments/dashboard/team/manager_profile_page.dart';
import 'package:brokr/ui/host/pages/host_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:get/get.dart';
import 'controllers/global_controller.dart';
import 'ui/broker/broker_home_page.dart';
import 'ui/commons/pages/base_page.dart';
import 'ui/commons/pages/example_page.dart';
import 'ui/commons/pages/authentication/login_page.dart';
import 'ui/commons/pages/authentication/splash_page.dart';
import 'ui/commons/pages/authentication/verify_phone_page.dart';
import 'ui/commons/pages/authentication/verify_email_page.dart';
import 'ui/commons/pages/authentication/confirmed_page.dart';
import 'ui/commons/pages/home_page.dart';
import 'ui/guest/fragments/chat/chat_room_fragment.dart';
import 'ui/guest/pages/guest_home_page.dart';
import 'utils/languages_utils.dart';
import 'utils/theme_utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put<GlobalController>(GlobalController(), permanent: true);
  // await dotenv.load(fileName: 'enviroment/dotenv.prod');
  // await dotenv.load(fileName: 'enviroment/dotenv.debug');
  await Settings.init(cacheProvider: SharePreferenceCache());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final routes = <String, WidgetBuilder>{
    ExamplePage.name: (context) => const ExamplePage(),
    SplashPage.name: (context) => const SplashPage(),
    LoginPage.name: (context) => const LoginPage(),
    VerifyPhonePage.name: (context) => const VerifyPhonePage(),
    VerifyEmailPage.name: (context) => const VerifyEmailPage(),
    ConfirmedPage.name: (context) => const ConfirmedPage(),
    GuestHomePage.name: (context) => const GuestHomePage(),
    HostHomePage.name: (context) => const HostHomePage(),
    BrokerHomePage.name: (context) => const BrokerHomePage(),
    HomePage.name: (context) => const HomePage(),
    ChatRoomFragment.name: (context) => const ChatRoomFragment(),
    PersonalPage.name: (context) => const PersonalPage(),
    PaymentsPage.name: (context) => const PaymentsPage(),
    LanguagePage.name: (context) => const LanguagePage(),
    NotificationsPage.name: (context) => const NotificationsPage(),
    PrivacyPage.name: (context) => const PrivacyPage(),
    CreditsPage.name: (context) => const CreditsPage(),
    ReferalPage.name: (context) => const ReferalPage(),
    SupportPage.name: (context) => const SupportPage(),
    LegalPage.name: (context) => const LegalPage(),
    ManagerPage.name: (context) => ManagerPage(),
    BrokerPage.name: (context) => BrokerPage(),
    ListingsSettingsFragment.name: (context) => ListingsSettingsFragment(),
  };

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return GetMaterialApp(
      builder: (BuildContext context, Widget? child) {
        final mediaQueryData = MediaQuery.of(context);
        final scale = mediaQueryData.textScaleFactor.clamp(1.0, 1.0);
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: scale),
          child: BasePage(child: child!),
        );
      },
      title: 'Brokr',
      debugShowCheckedModeBanner: false,
      theme: ThemeUtils.defaultTheme(),
      initialRoute: SplashPage.name,
      routes: routes,
      // getPages: [
      //   GetPage(name: '/', page: () => GuestHomePage()),
      //   GetPage(name: '/chat', page: () => const ChatFragment()),
      //   GetPage(
      //       name: '/chatRoom',
      //       page: () => const ChatRoomFragment(),
      //       transition: Transition.rightToLeftWithFade),
      //   // GetPage(
      //   //     name: '/manager',
      //   //     page: () => ManagerPage(),
      //   //     transition: Transition.rightToLeftWithFade),
      //   // GetPage(
      //   //     name: '/broker',
      //   //     page: () => BrokerPage(),
      //   //     transition: Transition.rightToLeftWithFade),
      //   // GetPage(
      //   //     name: '/listing',
      //   //     page: () => ListingsSettingsPage(),
      //   //     transition: Transition.rightToLeftWithFade),
      // ],
      translations: Languages(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
    );
  }
}
