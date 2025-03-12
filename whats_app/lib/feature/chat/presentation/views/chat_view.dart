import 'package:flutter/material.dart';
import 'package:whats_app/feature/chat/presentation/views/widgets/chatView_body.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: ChatviewBody(),
    );
  }
}
