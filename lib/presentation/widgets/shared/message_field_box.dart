import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;

  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
//To control the behavior of the text box
    final textController = TextEditingController();
    //To control focus.
    final focusNode = FocusNode();

    final colors = Theme.of(context).colorScheme;

//These variables are created to store the same value for the decoration of the text input box since that box has 2 states, focused and enabled, we need it to be the same for both so it doesnt jump over the screen due to a variance in style.
    final enabledborder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      borderSide: BorderSide(color: colors.primary),
    );

    final focusedborder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      borderSide: BorderSide(color: colors.primary),
    );

    final textFormDecoration = InputDecoration(
      hintText: 'Type a message ending with "?"',
      enabledBorder: enabledborder,
      focusedBorder: focusedborder,
      filled: true,
      suffixIcon: IconButton(
        onPressed: () {
          final textValue = textController.text;

          onValue(textValue);
          focusNode.requestFocus();
        },
        icon: const Icon(Icons.send_outlined),
      ),
    );

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      decoration: textFormDecoration,
      controller: textController,
      onFieldSubmitted: (value) {
        // textController.clear();
        focusNode.requestFocus();
        focusNode.unfocus();
        onValue(value);
      },
    );
  }
}
