import 'package:brokr/ui/guest/fragments/chat/chat_room_fragment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/chat_controller.dart';
import '../../widgets/tiles/contact_tile_widget.dart';

class ChatFragment extends StatefulWidget {
  const ChatFragment({super.key});

  @override
  _ChatFragmentState createState() => _ChatFragmentState();
}

class _ChatFragmentState extends State<ChatFragment> {
  final controller = Get.put(ChatController());

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            'Inbox',
            style: TextStyle(
              fontSize: 30,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          backgroundColor: Colors.white,
          centerTitle: false,
        ),
        body: ListView.builder(
          itemCount: controller.ChatRooms.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Get.toNamed(ChatRoomFragment.name,
                    arguments: controller.ChatRooms[index]);
              },
              child: ContactTile(chat: controller.ChatRooms[index]),
            );
          },
        ),
      );
}
