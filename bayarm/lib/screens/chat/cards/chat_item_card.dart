import 'package:bayarm/constants/constants.dart';
import 'package:bayarm/models/chat_model.dart';
import 'package:flutter/material.dart';

class ChatItemCard extends StatelessWidget {
  final ChatModel chatItem;
  final GestureTapCallback? onTap;

  const ChatItemCard({
    Key? key,
    this.onTap,
    required this.chatItem,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: chatItem.chat == 0
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '${chatItem.time}',
              style: TextStyle(color: Colors.grey.shade400),
            ),
            Flexible(
              child: Container(
                margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: chatItem.chat == 0 ? secondaryColor : primaryColor,
                  borderRadius: chatItem.chat == 0
                      ? const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                        )
                      : const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                ),
                child: Text(
                  '${chatItem.message}',
                  style: TextStyle(color: white, fontWeight: FontWeight.w300),
                ),
              ),
            ),
            chatItem.chat == 1
                ? Text(
                    '${chatItem.time}',
                    style: const TextStyle(color: white),
                  )
                : const SizedBox(),
          ],
        ));
  }
}

// Identifies the children of a _ListTileElement.
enum _ListTileSlot {
  nom,
  description,
  rating,
  cookTime,
  thumbnailUrl,
}

Iterable<_ListTileSlot> get slots => _ListTileSlot.values;

@override
bool hitTestSelf(Offset position) => true;
