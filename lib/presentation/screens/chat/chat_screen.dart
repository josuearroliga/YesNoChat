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
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://m.media-amazon.com/images/M/MV5BOTE5OWY5MTEtOGFhZS00ZDJmLWE0MTQtZjliNGNjMTRhNDAzXkEyXkFqcGdeQXVyMTE0MTkwNTIw._V1_.jpg'),
          ),
        ),
        centerTitle: false,
        title: const Text('Mi Amor'),
      ),
      body: _ChatView(),
    );
  }
}

//Widget que va a ir en le body y se encarga de crer un column con los chats y area para escribir nuevo chat.
class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            //Expanded hace que agarre todo el espacio available.
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollConctroller,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messageList[index];
                  return (message.fromWho == FromWho.hers)
                      ? HerMessagebubble(
                          message: message,
                        )
                      : MyMessageBubble(
                          message: message,
                        );
                },
              ),
            ),
            MessageFieldBox(
              onValue: (value) => chatProvider.sendMessage(value),
            ),
          ],
        ),
      ),
    );
  }
}
