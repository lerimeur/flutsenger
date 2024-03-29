import 'package:chat/models/Chat.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({
    Key? key,
    required this.conv,
    required this.press,
  }) : super(key: key);

  final Conv conv;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding, vertical: kDefaultPadding * 0.75),
        child: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 24,
                  // backgroundImage: AssetImage(conv),
                ),
                // if (conv.isActive)
                // Positioned(
                //   right: 0,
                //   bottom: 0,
                //   child: Container(
                //     height: 16,
                //     width: 16,
                //     decoration: BoxDecoration(
                //       color: kPrimaryColor,
                //       shape: BoxShape.circle,
                //       border: Border.all(
                //           color: Theme.of(context).scaffoldBackgroundColor,
                //           width: 3),
                //     ),
                //   ),
                // )
              ],
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      conv.title,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 8),
                    Opacity(
                      opacity: 0.64,
                      child: Text(
                        conv.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Opacity(
              opacity: 0.64,
              child: Text('time'),
            ),
          ],
        ),
      ),
    );
  }
}
