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
            Flexible(
              child: Container(
                margin: const EdgeInsets.only(left: 0, right: 10, top: 20),
                padding: const EdgeInsets.all(appPadding),
                decoration: BoxDecoration(
                  color: chatItem.chat == 0 ? primaryColor : Colors.blueGrey,
                  borderRadius: chatItem.chat == 0
                      ? const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        )
                      : const BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${chatItem.message}',
                      style: const TextStyle(color: white, fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(height: appPadding*0.5,),
                    Text(
                      '${chatItem.time}',
                      style: const TextStyle(color: white,fontSize: 10),
                    )
                  ],
                )
              ),
            ),

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
