import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hola chat'),
        centerTitle: true,
        leading: const Padding(
          padding: EdgeInsets.all(2),
          child: CircleAvatar(
            backgroundImage:  NetworkImage('https://techstory.in/wp-content/uploads/2022/02/lana-rhoades-fb-1.jpg')
            // NetworkImage('https://www.mrdustbin.com/us/wp-content/uploads/2022/02/emma-watson.jpg'),
          ),
        ),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messageList[index];

                  return ( message.fromWhom == FromWhom.me ) 
                  ? MyMessageBubble(message: message)
                  : HerMessageBubble(message: message);
                }
              )
            ),
            const MessageField()
          ],
        ),
      ),
    );
  }
}