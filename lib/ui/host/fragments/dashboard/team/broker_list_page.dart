import 'package:brokr/ui/host/fragments/dashboard/team/broker_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../controllers/managerListPageController.dart';
import '../../../../widgets/staffTile.dart';

class BrokerListPage extends StatefulWidget {
  const BrokerListPage({super.key});

  @override
  _BrokerListPageState createState() => _BrokerListPageState();
}

class _BrokerListPageState extends State<BrokerListPage> {
  final controller = Get.put(ManagerListPageController());

  // List<ContactTile> contactList = [
  //   ContactTile(
  //       image:
  //           'https://images.unsplash.com/flagged/photo-1566127992631-137a642a90f4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8&auto=format&fit=crop&w=900&q=60',
  //       user: "Ray",
  //       lastMessage: "hi",
  //       timeLastMessage: "12:30"),
  //   ContactTile(
  //       image:
  //           'https://img.freepik.com/free-photo/handsome-young-businessman-suit_273609-6513.jpg',
  //       user: "Paul",
  //       lastMessage: "hi",
  //       timeLastMessage: "14:30"),
  //   ContactTile(
  //       image: 'https://cdn-icons-png.flaticon.com/512/610/610120.png',
  //       user: "Carlos",
  //       lastMessage: "Is it still available",
  //       timeLastMessage: "15:30"),
  //   ContactTile(
  //       image: 'https://cdn-icons-png.flaticon.com/512/610/610120.png',
  //       user: "Luis",
  //       lastMessage: "Sup.",
  //       timeLastMessage: "22:00"),
  //   ContactTile(
  //       image:
  //           'https://media.npr.org/assets/img/2017/09/12/macaca_nigra_self-portrait-3e0070aa19a7fe36e802253048411a38f14a79f8-s1100-c50.jpg',
  //       user: "Team Gaviota",
  //       lastMessage: "Gotta repaint the cabin.",
  //       timeLastMessage: "09:15")
  // ].reversed.toList();

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: const Text(
          'Brokers',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: controller.list.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: GestureDetector(
                  onTap: () {
                    Get.toNamed(BrokerPage.name,
                        arguments: controller.list[index].name);
                  },
                  child: Center(
                      child: StaffTile(manager: controller.list[index]))),
            );
          }));
}
