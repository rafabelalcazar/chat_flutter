import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> messages = [
    Message(text: 'Hello', fromWhom: FromWhom.transmitter),
    Message(text: 'Hello, whats going on', fromWhom: FromWhom.receiver)
  ];

  Future<void> sendMessage(String text) async {
    // TODO: Implement this method
  }
}