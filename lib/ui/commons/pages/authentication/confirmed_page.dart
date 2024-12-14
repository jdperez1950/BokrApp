import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../guest/pages/guest_home_page.dart';

import '../../../widgets/gradient_button.dart';

class ConfirmedPage extends StatelessWidget {
  static String name = '/confirmed-page';

  const ConfirmedPage({super.key});

  @override
  Widget build(BuildContext context) {
    String title = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$title confirmed',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 17,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/lottie/success.json',
              height: MediaQuery.of(context).size.width,
              fit: BoxFit.contain,
              animate: true,
            ),
            const Text(
              'Congratulations',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'your account has been successfully\nverified and activated',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            const Spacer(),
            GradientButton(
              text: 'Continue',
              onTap: () {
                Get.offAllNamed(GuestHomePage.name);
              },
              cornersRadius: 8,
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
