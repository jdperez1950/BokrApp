import 'package:flutter/material.dart';

import '../../../models/chat_room_model.dart';

class ContactTile extends StatelessWidget {
  final ChatRoomModel chat;

  const ContactTile({
    Key? key,
    required this.chat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 36),
      height: 100,
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  chat.image,
                  fit: BoxFit.cover,
                  width: 72,
                  height: 72,
                )),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                Row(
                  children: [
                    Text(
                      chat.title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      chat.time,
                      style: const TextStyle(
                        fontSize: 10,
                        color: Color(0xFF9D9D9D),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  chat.subtitle,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
