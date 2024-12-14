import 'package:brokr/ui/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'confirmed_page.dart';
import '../../../widgets/pin_widget.dart';

class VerifyPhonePage extends StatefulWidget {
  static String name = '/verify-phone-page';

  const VerifyPhonePage({super.key});

  @override
  State createState() => _VerifyPhonePage();
}

class _VerifyPhonePage extends State<VerifyPhonePage> {
  var _phoneNumber = '';
  final _pinController = TextEditingController();
  final _focusNode = FocusNode();
  int _optionSelected = 0;

  @override
  void initState() {
    _focusNode.requestFocus();
    _phoneNumber = Get.arguments;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Confirm your phone number',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 17,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 32),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: RichText(
                  text: TextSpan(
                    text: 'Enter the code we sent over SMS to:\n',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: _phoneNumber,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: PinWidget(
                pinController: _pinController,
                focusNode: _focusNode,
                onCompleted: (value) {
                  Get.offAllNamed(
                    ConfirmedPage.name,
                    arguments: 'number',
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            InkWell(
              onTap: () {},
              child: RichText(
                text: const TextSpan(
                  text: 'Didn\'t receive any code? ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Resend code',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: () {
                showMaterialModalBottomSheet(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                  ),
                  context: context,
                  builder: (context2) => Container(
                    padding: const EdgeInsets.all(32),
                    child: StatefulBuilder(
                      builder: (context3, setSheetState) => Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: 75,
                              height: 6,
                              decoration: const BoxDecoration(
                                color: Color(0xFFD9D9D9),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3)),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'More options',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          const SizedBox(height: 24),
                          Text(
                            'Choose another way to get a verification code\nat $_phoneNumber',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Make sure your notifications are turned on',
                            style: TextStyle(color: Color(0xFFAFB1B6)),
                          ),
                          const SizedBox(height: 32),
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/message_icon.png',
                                height: 38,
                                width: 38,
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'SMS',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6!
                                          .copyWith(fontSize: 18),
                                    ),
                                    Text(
                                      'Check your text messages',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline3!
                                          .copyWith(
                                            fontSize: 14,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Radio<int>(
                                value: 0,
                                groupValue: _optionSelected,
                                activeColor: Colors.orange,
                                onChanged: (value) {
                                  setSheetState(() {
                                    _optionSelected = value!;
                                  });
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          const Divider(
                            color: Colors.black,
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/call_icon.png',
                                height: 38,
                                width: 38,
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Call Me',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6!
                                          .copyWith(fontSize: 18),
                                    ),
                                    Text(
                                      'Get an automated call',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline3!
                                          .copyWith(
                                            fontSize: 14,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Radio<int>(
                                value: 1,
                                groupValue: _optionSelected,
                                activeColor: Colors.orange,
                                onChanged: (value) {
                                  setSheetState(() {
                                    _optionSelected = value!;
                                  });
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 32),
                          GradientButton(
                            text: 'Continue',
                            onTap: () {
                              Get.offAllNamed(
                                ConfirmedPage.name,
                                arguments: 'number',
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              child: const Text(
                'More options',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
