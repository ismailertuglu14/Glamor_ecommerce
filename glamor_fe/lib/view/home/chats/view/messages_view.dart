import 'package:client/core/extension/context_extension.dart';
import 'package:client/view/home/chats/widget/chat_card.dart';
import 'package:flutter/material.dart';

class MessagesView extends StatefulWidget {
  const MessagesView({super.key});
  @override
  State<MessagesView> createState() => _MessagesViewState();
}

class _MessagesViewState extends State<MessagesView> {
  int messageCount = 1;
  @override
  Widget build(BuildContext context) {
    return _buildScaffold(context);
  }

  Scaffold _buildScaffold(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            messageCount == 0
                ? SizedBox(
                    height: context.height,
                    width: context.width,
                    child: Center(
                      child: Text(
                        'There are no conservation exist!',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontSize: 24),
                      ),
                    ),
                  )
                : const ChatCard(),
          ],
        ),
      ),
    );
  }
}
