import 'package:flutter/material.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 30.0,
            backgroundImage: NetworkImage(
                "https://media.kommunity.com/avatar/f6cb0e99-784f-45f1-a928-be220a97e4de_avatar_638b3d9253d83.jpeg?p=avatar-120"),
            backgroundColor: Colors.transparent,
          ),
          const SizedBox(width: 20),
          SizedBox(
            height: 60,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'İsmail Ertuğlu',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  'Hala satılıksa alıyorum!',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
