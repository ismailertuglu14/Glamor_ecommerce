// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const CircleAvatar(
          backgroundImage: NetworkImage(
              'https://lh3.googleusercontent.com/ogw/AOh-ky0FbHqdSwVlRuYrWf-hkvNJkDfbMnenWPJcrge6YQ=s32-c-mo'),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('İsmail Ertuglu'),
            Text(
              'ismailertgl@gmail.com',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.primaryVariant),
            ),
          ],
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_forward_ios),
          tooltip: 'Settings',
        ),
      ),
    );
  }
}
