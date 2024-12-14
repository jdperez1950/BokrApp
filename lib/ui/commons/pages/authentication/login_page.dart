import 'package:brokr/ui/commons/pages/authentication/verify_email_page.dart';
import 'package:brokr/ui/commons/pages/authentication/verify_phone_page.dart';
import 'package:brokr/ui/widgets/gradient_button.dart';
import 'package:brokr/ui/widgets/input_field.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../../controllers/global_controller.dart';
import '../../../../utils/theme_utils.dart';
import '../../../widgets/select_country_widget.dart';
import '../../../widgets/social_button.dart';

class LoginPage extends StatefulWidget {
  static String name = '/login-page';

  const LoginPage({super.key});

  @override
  State createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final phoneMask = MaskTextInputFormatter(mask: '(###) ###-##-##');
  String? _countryName;
  Country? _selectedCountry;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _ctr = Get.find<GlobalController>();
  bool _showingEmail = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Log in or Sign up',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 17,
          ),
        ),
        leading: _showingEmail
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _showingEmail = false;
                  });
                },
                icon: const Icon(Icons.arrow_back),
              )
            : null,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
        elevation: 1,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
        child: Column(
          children: [
            if (!_showingEmail)
              SelectCountryWidget(
                countryName: _countryName,
                onSelect: (country) {
                  setState(() {
                    _countryName = '${country.name} +${country.phoneCode}';
                    _selectedCountry = country;
                  });
                },
              ),
            if (_showingEmail)
              InputField(
                labelText: 'Email',
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                cornersValue: 8,
              ),
            const SizedBox(height: 16),
            if (!_showingEmail)
              InputField(
                labelText: 'Phone number',
                keyboardType: TextInputType.phone,
                controller: _phoneController,
                cornersValue: 8,
                formatters: [phoneMask],
              ),
            if (_showingEmail)
              InputField(
                labelText: 'Password',
                keyboardType: TextInputType.text,
                obscureText: true,
                controller: _passwordController,
                cornersValue: 8,
              ),
            if (!_showingEmail) const SizedBox(height: 16),
            if (!_showingEmail)
              Text(
                'We’ll call or text you to confirm your number. Standard message and data rates apply.',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
            const SizedBox(height: 16),
            GradientButton(
              text: 'Continue',
              onTap: () {
                if (_showingEmail) {
                  if (_emailController.text.isEmpty) {
                    _ctr.showError('Error', 'Please enter an email address');
                    return;
                  }
                  if (_passwordController.text.isEmpty) {
                    _ctr.showError('Error', 'Please enter your password');
                    return;
                  }

                  Get.toNamed(
                    VerifyEmailPage.name,
                    arguments: _emailController.text,
                  );
                } else {
                  if (_selectedCountry == null) {
                    _ctr.showError('Error', 'Please select a country');
                    return;
                  }

                  if (_phoneController.text.isEmpty) {
                    _ctr.showError('Error', 'Please enter a phone number');
                    return;
                  }

                  Get.toNamed(
                    VerifyPhonePage.name,
                    arguments:
                        '+${_selectedCountry!.phoneCode} ${_phoneController.text}',
                  );
                }
              },
              textSize: 17,
              weight: FontWeight.w500,
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: ThemeUtils.gradientButtonAlt,
                  stops: const [
                    0.0,
                    0.01,
                    0.02,
                    0.47,
                    0.9,
                  ]),
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 1,
                    color: const Color(0x80B6B1B1),
                  ),
                ),
                const SizedBox(width: 16),
                const Text(
                  'Or',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    height: 1,
                    color: const Color(0x80B6B1B1),
                  ),
                ),
              ],
            ),
            const Spacer(),
            if (!_showingEmail)
              SocialButton(
                text: 'Continue with email',
                icon: 'assets/icons/email_icon.svg',
                onTap: () {
                  setState(() {
                    _showingEmail = true;
                  });
                },
              ),
            const Spacer(),
            SocialButton(
              text: 'Continue with Apple',
              icon: 'assets/icons/apple_icon.svg',
              onTap: () {},
            ),
            const SizedBox(height: 16),
            SocialButton(
              text: 'Continue with Google',
              icon: 'assets/icons/google_icon.svg',
              onTap: () {},
            ),
            const SizedBox(height: 16),
            SocialButton(
              text: 'Continue with Facebook',
              icon: 'assets/icons/facebook_icon.svg',
              onTap: () {},
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 1,
                    color: const Color(0x80B6B1B1),
                  ),
                ),
                const SizedBox(width: 16),
                const Text(
                  'Sign up as Broker',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    height: 1,
                    color: const Color(0x80B6B1B1),
                  ),
                ),
              ],
            ),
            const Spacer(),
            GradientButton(text: 'Apply here', onTap: () {}),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
