import 'package:brokr/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:get/get.dart';

import '../../../../controllers/test_controller.dart';
import '../../../commons/pages/home_page.dart';
import '../../../widgets/icon_widget.dart';

const List<String> list = <String>['Guest', 'Host', 'Broker'];

class HeaderFragment extends StatelessWidget {
  static const keyDarkMode = 'key-dark-mode';
  static const name = "Raymond Mauge";
  static const phone = "raymond@gmail.com";

  const HeaderFragment({super.key});

  @override
  Widget build(BuildContext context) => Column(
        children: [
          buildHeader(),
          const SizedBox(height: 16),
          buildUser(context),
          //buildDarkMode(),
        ],
      );

  Widget buildDarkMode() => SwitchSettingsTile(
        settingKey: keyDarkMode,
        leading: const IconWidget(
          icon: Icons.dark_mode,
          color: Colors.white,
        ),
        title: 'Dark Mode',
        onChange: (_) {},
      );

  Widget buildHeader() => Row(
        children: const [
          Text(
            'Profile',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          ),
          Spacer(),
          DropdownButtonExample(),
        ],
      );

  Widget buildUser(BuildContext context) => InkWell(
        onTap: () {},
        child: Row(
          children: [
            ClipOval(
              child: Image.network(
                'https://images.unsplash.com/flagged/photo-1566127992631-137a642a90f4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8&auto=format&fit=crop&w=900&q=60',
                fit: BoxFit.cover,
                width: 98,
                height: 98,
              ),
            ),
            const SizedBox(width: 24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  phone,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
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
  final controller = Get.put(TestController());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      padding: const EdgeInsets.only(
        left: 32,
        right: 16,
      ),
      decoration: BoxDecoration(
        color: ThemeUtils.dropDownButtonColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: DropdownButton<String>(
        value: controller.session,
        underline: const SizedBox.shrink(),
        icon: const Icon(Icons.expand_more),
        onChanged: (String? value) {
          setState(() {
            if (value == 'Guest') {
              dropdownValue = 'Guest';
              controller.changeToGuest();
            }
            if (value == 'Broker') {
              dropdownValue = 'Broker';
              controller.changeToBrokr();
            }
            if (value == 'Host') {
              dropdownValue = 'Host';
              controller.changeToHost();
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: Text('brokrRefundPolicy'.tr),
                        content: Text('brokrRefundPolicyContent'.tr),
                        actions: <Widget>[
                          ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Ok'))
                        ],
                      ));
            }
          });
          Get.offAllNamed(HomePage.name);
        },
        items: list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
